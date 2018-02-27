const router = require('express').Router();
const Airtable = require('airtable');
const base = Airtable.base(process.env.AIRTABLE_BASE);
const fs = require('fs');
const path = require('path');
const sendemail = require('sendemail');

Airtable.configure({
  endpointUrl: 'https://api.airtable.com',
  apiKey: process.env.AIRTABLE_API_KEY
});

router.route('/upload-form').post((req, res, next) => {
  let newForm = req.body;
  base(process.env.AIRTABLE_TABLE).create(newForm, (err, record) => {
    if (err) {
      console.log('ERR', err);
      return res.json({ success: false });
    }
    console.log('SUCCESS', record);
    return res.json({ success: true });
  });
});

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
