# maildrop [![Travis CI](https://travis-ci.org/melvinsh/maildrop.svg)](https://travis-ci.org/melvinsh/maildrop) [![Coverage Status](https://coveralls.io/repos/github/melvinsh/maildrop/badge.svg?branch=master)](https://coveralls.io/github/melvinsh/maildrop?branch=master)

Ruby interface to MailDrop. MailDrop provides free disposable e-mail addresses.

## Installation 
Add this line to your `Gemfile`:
``` ruby
gem 'maildrop'
```

## Usage
### Mailbox
Access a mailbox by name:
``` ruby
mailbox = Maildrop::Mailbox.get('example_name')
```
This is equal to visiting http://maildrop.cc/inbox/example_name.

You can also generate a random (12-character) name:
``` ruby
mailbox = Maildrop::Mailbox.random_get
```
Both return a `Maildrop::Models::Mailbox` object with a `name` attribute.

### Emails
Emails can be accessed through `mailbox.emails` and have the following attributes:
``` ruby
email = mailbox.emails.first

email.sender        # sender email address (String)
email.subject       # email subject (String)
email.date          # date received (DateTime)
email.body          # email body (String, either plaintext or HTML)
```
