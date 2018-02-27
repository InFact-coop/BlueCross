if (navigator.mediaDevices) {
  console.log('getUserMedia supported.');
  console.log('App: ', app);

  var constraints = {
    audio: true,
    video: true
  };
  var chunks = [];
  var mediaRecorder;

  app.ports.recordStart.subscribe(function() {
    console.log('HELLO');
    navigator.mediaDevices
      .getUserMedia(constraints)
      .then(function(stream) {
        mediaRecorder = new MediaRecorder(stream);
        mediaRecorder.start();
        console.log(mediaRecorder.state);
        console.log('recorder started');

        mediaRecorder.onstop = function(e) {
          console.log('data available after MediaRecorder.stop() called.');

          var blob = new Blob(chunks, { type: 'video/webm' });
          chunks = [];
          // js to elm
          var videoURL = window.URL.createObjectURL(blob);
          console.log('blob', blob);
          app.ports.videoUrl.send(videoURL);
          console.log('VideoURL: ', videoURL);
          console.log('recorder stopped');
        };

        mediaRecorder.ondataavailable = function(e) {
          chunks.push(e.data);
        };
      })
      .catch(function(err) {
        // js to elm
        console.log("Can't start video!");
        app.ports.recordError.send("Can't start video!");
      });
  });

  app.ports.recordStop.subscribe(function() {
    if (mediaRecorder) {
      mediaRecorder.stop();
    }
    console.log(mediaRecorder.state);
    console.log('recorder stopped');
  });
}
