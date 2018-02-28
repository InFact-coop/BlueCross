// Upload Photos Port

app.ports.fileSelected.subscribe(function(id) {
  var node = document.getElementById(id);
  var fileList = [];
  if (node === null) {
    return;
  }

  for (var i = 0; i < node.files.length; i++) {
    var file = node.files[i];
    var reader = new FileReader();

    reader.onload = function(event) {
      var base64encoded = event.target.result;
      var portData = {
        contents: base64encoded,
        filename: file.name
      };
      fileList.push(portData);
    };

    reader.readAsDataURL(file);
    var stringified = JSON.stringify(fileList);
  }

  reader.onloadend = function(event) {
    app.ports.fileContentRead.send(fileList);
  };
});

// Take a Photo Port
app.ports.preparePhoto.subscribe(function() {
  navigator.mediaDevices
    .getUserMedia({ video: true })
    .then(function(mediaStream) {
      var recorder = new MediaRecorder(mediaStream);
      var mediaStreamTrack = mediaStream.getVideoTracks()[0];
      var imageCapture = new ImageCapture(mediaStreamTrack);

      var liveUrl = window.URL.createObjectURL(mediaStream);
      app.ports.liveVideoUrl.send(liveUrl);
      console.log(imageCapture);
      app.ports.takePhoto.subscribe(function() {
        imageCapture.takePhoto().then(function(blob) {
          var portData = {
            contents: window.URL.createObjectURL(blob),
            filename: ''
          };
          app.ports.receivePhotoUrl.send(portData);
        });
      });
      app.ports.stopPhoto.subscribe(function() {
        if (recorder.state !== 'inactive') {
          recorder.stop();
        }
        mediaStream.getTracks().map(function(track) {
          track.stop();
          mediaStream.removeTrack(track);
        });
      });
    })
    .catch(function(error) {
      console.error('getUserMedia() error:', error);
    });
});
