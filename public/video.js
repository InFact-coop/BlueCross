// if (!navigator.mediaDevices) {
//   alert('getUserMedia support required to use this page');
// }
// let recorder;
// let url;
// let bigVideoBlob;
//
// app.ports.recordStart.subscribe(function() {
//   if (recorder.state !== 'recording') {
//     recorder.start();
//   }
//   console.log(recorder.state);
//   console.log('recorder started');
// });
//
// app.ports.prepareVideo.subscribe(function() {
//   const videoChunks = [];
//   let onDataAvailable = function(e) {
//     videoChunks.push(e.data);
//   };
//
//   navigator.mediaDevices
//     .getUserMedia({
//       audio: true,
//       video: {
//         width: { ideal: 640 },
//         height: { ideal: 360 }
//       }
//     })
//     .then(mediaStream => {
//       recorder = new MediaRecorder(mediaStream);
//       recorder.ondataavailable = onDataAvailable;
//       url = window.URL.createObjectURL(mediaStream);
//       app.ports.liveVideoUrl.send(url);
//
//       app.ports.recordStop.subscribe(function() {
//         if (recorder.state !== 'inactive') {
//           console.log('recorder', recorder);
//           recorder.stop();
//         }
//         mediaStream.getTracks().map(function(track) {
//           track.stop();
//           mediaStream.removeTrack(track);
//         });
//         console.log(recorder.state);
//         console.log('recorder stopped');
//       });
//
//       recorder.onstop = e => {
//         bigVideoBlob = new Blob(videoChunks, { type: 'video/mp4' });
//         console.log('e: ', e);
//         console.log('videoChunks: ', videoChunks);
//         var videoURL = window.URL.createObjectURL(bigVideoBlob);
//         app.ports.recordedVideoUrl.send(videoURL);
//       };
//     })
//     .catch(function(err) {
//       console.log('error', err);
//       app.ports.recordError.send("Can't start video!");
//     });
// });
