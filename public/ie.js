app.ports.checkIE.subscribe(function() {
  var userAgent = navigator.userAgent;
  var isIE =
    userAgent.indexOf('MSIE') !== -1 || userAgent.indexOf('Trident') !== -1;
  app.ports.isIE.send(isIE);
});
