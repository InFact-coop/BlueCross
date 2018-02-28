app.ports.fileSelected.subscribe(function(id) {
  var node = document.getElementById(id);
  var fileList = [];
  if (node === null) {
    return;
  }
  console.log('fileSelected');
  // If your file upload field allows multiple files, you might
  // want to consider turning this into a `for` loop.
  for (var i = 0; i < node.files.length; i++) {
    var file = node.files[i];
    var reader = new FileReader();
    // FileReader API is event based. Once a file is selected
    // it fires events. We hook into the `onload` event for our reader.
    reader.onload = function(event) {
      // The event carries the `target`. The `target` is the file
      // that was selected. The result is base64 encoded contents of the file.
      var base64encoded = event.target.result;
      // We build up the `ImagePortData` object here that will be passed to our Elm
      // runtime through the `fileContentRead` subscription.
      var portData = {
        contents: base64encoded,
        filename: file.name
      };
      console.log('Port data', portData);
      fileList.push(portData);
    };
    // Connect our FileReader with the file that was selected in our `input` node.
    reader.readAsDataURL(file);
    // We call the `fileContentRead` port with the file data
    // which will be sent to our Elm runtime via Subscriptions.
  }
  console.log('file list', fileList);
  app.ports.fileContentRead.send(fileList);
});

// Array.prototype.forEach.call(field.photo.files, function(file) { ... });
