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
  cloudinary.v2.uploader.upload(`filepath`, (result, err) => {
    if (err) {
      console.log('err', err);
      return res.json({ success: false });
    }
    console.log('result', result);
    return res.json({ success: true });
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
