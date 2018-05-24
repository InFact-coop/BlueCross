# Blue Cross App on Heroku

**Hey Blue Cross!**

The "Rehome your pet" app is hosted on a service called **Heroku**, which you guys have access to. We have inserted a couple of **config variables** into your account. This is not as intimidating as it sounds. It basically means that you can edit certain things (like which email addresses you are sending to) easily, and without coding input, as you see fit.

**IMPORTANT**: This area that you have access to has the ability to break the app. It is important that you **only change** the config variables we outline below. Please leave anything prefixed with **AWS**, **CLOUDINARY**, or **TEMPLATE** unchanged. You are welcome to keep the details of the config variables written down somewhere, but bear in mind that these are **private** and should be treated and stored as sensitively as you would a password.

To access your **config variables**, do the following:

1.  Visit your Heroku account at https://dashboard.heroku.com/apps/bluecross/settings
2.  If you are not there already, go to the _Settings_ tab.
3.  Under the 'Config vars' section, click on the '**Reveal Config vars**' button.
4.  To edit a variable, click on the pencil icon next to it. A popup will appear. Update the _Value_ field as you see fit, and then, when you are ready, click _Save changes_.

## Config variables you can change (and what they do)

* **INTERNAL_RECIPIENT** (Required) : This is where you write the _primary_ email address you would like your internal email sent _TO_.
* **SENDER_EMAIL_ADDRESS** (Required): This is where you write the email address you would like all of your emails sent _FROM_. **Note** - In order to be able to do this, you will first need to _verify this email address_ in your _Amazon Simple Email Service console_. Please [follow this link to Amazon's documentation](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-email-addresses-procedure.html) which will explain in more detail how to do this.
* **INTERNAL_RECIPIENT_NAME** (Optional): This is where you write the name that will appear in the greeting of your internal email (if this is set to Kelly, the greeting for the internal email will read, _"Hi, Kelly!"_). If you leave it blank, it will default to 'Blue Cross'.
* **INTERNAL_RECIPIENTS_CC** (Optional): This is where you write all of the email addresses you would like the email _cc'ed_ to. This field should...

  1.  contain no spacing
  2.  have each email address separated by a semi-colon.

  This is a valid example : "person@bluecross.org.uk;otherperson@bluecross.org.uk"

* **INTERNAL_RECIPIENTS_BCC** (Optional): This is where you write all of the email addresses you would like the email _bcc'ed_ to. This field should...

  1.  contain no spacing
  2.  have each email address separated by a semi-colon.

  This is a valid example : "hiddenemail@bluecross.org.uk;otherhiddenemail@bluecross.org.uk"

**Best wishes,**

**The InFact team**
