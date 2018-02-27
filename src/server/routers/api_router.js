const router = require('express').Router();
const fs = require('fs');
const path = require('path');
const sendemail = require('sendemail');

router.route('/send-confirmation').get((req, res, next) => {
  const dir = path.join(__dirname, '..', '..', 'email', 'templates');
  const email = sendemail.email;
  sendemail.set_template_directory(dir);

  const person = {
    name: 'Jenny',
    otherInfo: 'Who is it',
    email: 'mgerber94@gmail.com',
    subject: 'Welcome to InFact :)'
  };

  email('welcome', person, (error, result) => {
    if (error) {
      console.log('Error: ', error);
      return res.json({ success: false });
    }
    console.log('Email Sent: ', result);
    return res.json({ success: true });
  });
});

module.exports = router;
