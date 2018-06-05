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
  const internalEmail = sendemail.sendMany;
  const externalEmail = sendemail.email;
  const body = Object.freeze(req.body);

  const internalCcAddresses =
    process.env.INTERNAL_RECIPIENTS_CC.split(';') || [];
  const internalBccAddresses =
    process.env.INTERNAL_RECIPIENTS_BCC.split(';') || [];

  sendemail.set_template_directory(dir);

  const internalEmailData = {
    templateName: 'internal-confirmation',
    subject: 'Someone is ready to rehome their dog!',
    toAddresses: [process.env.INTERNAL_RECIPIENT],
    ccAddresses: internalCcAddresses,
    bccAddresses: internalBccAddresses,
    context: {
      ...body,
      name: process.env.INTERNAL_RECIPIENT_NAME || 'Blue Cross'
    }
  };
  const externalEmailData = {
    email: body.email,
    subject: 'Blue Cross confirmation',
    ownerName: body.ownerName,
    petName: body.petName,
    imageUrls: body.imageUrls
  };

  internalEmail(internalEmailData, (intError, intResult) => {
    if (intError) {
      console.log('Internal Email Error: ', intError);
      return res.json({ success: false });
    }
    console.log('Internal Email Sent: ', intResult);
    console.log('internalEmailData', internalEmailData);

    externalEmail(
      'external-confirmation',
      externalEmailData,
      (extError, extResult) => {
        if (extError) {
          console.log('External Email Error: ', extError);
          return res.json({ success: false });
        }
        console.log('External Email Sent: ', extResult);
        console.log('externalEmailData', externalEmailData);
        return res.json({ success: true });
      }
    );
  });
});

module.exports = router;
