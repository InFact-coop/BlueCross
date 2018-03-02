const router = require('express').Router();
const path = require('path');
const sendemail = require('sendemail');
const cloudinary = require('cloudinary');

cloudinary.config({
  cloud_name: process.env.CLOUDINARY_CLOUDNAME,
  api_key: process.env.CLOUDINARY_API_KEY,
  api_secret: process.env.CLOUDINARY_API_SECRET
});

router.route('/upload-photos').post((req, res, next) => {
  const images = req.body;

  const imageToPromise = image => {
    return new Promise((resolve, reject) => {
      cloudinary.v2.uploader.upload(image.contents, (err, result) => {
        if (err) {
          reject(null);
          console.log('File Error', err);
        } else {
          resolve(result.secure_url);
          console.log('File Success: ', result);
        }
      });
    });
  };

  const cloudinaryPromises = images.map(imageToPromise);

  Promise.all(cloudinaryPromises)
    .then(values => {
      console.log('Final Values: ', values);
      return res.json({ success: true, urls: values });
    })
    .catch(err => {
      console.log('Final Error: ', err);
      return res.json({ success: false });
    });
});

router.route('/send-form').post((req, res, next) => {
  const dir = path.join(__dirname, '..', '..', 'email', 'templates');
  const email = sendemail.email;
  sendemail.set_template_directory(dir);
  const internalEmailData = req.body;
  console.log('Internal Email Data: ', req.body);
  internalEmailData.name = 'Kelly';
  internalEmailData.email = 'mgerber94@gmail.com';
  internalEmailData.subject = 'Someone is ready to rehome their dog!';

  email('internal-confirmation', internalEmailData, (error, result) => {
    if (error) {
      console.log('Error: ', error);
      return res.json({ success: false });
    }
    console.log('Email Sent: ', result);
    return res.json({ success: true });
  });
});

module.exports = router;
