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
