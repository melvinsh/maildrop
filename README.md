# maildrop

Ruby interface to MailDrop. MailDrop provides free disposable e-mail addresses.

## Installation 
Add this line to your `Gemfile`:
```
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

email.id            # unique ID assigned by MailDrop (string, example: "wsAGFt")
email.sender        # sender email address (sting)
email.subject       # email subject (string)
email.date          # date received (DateTime object)
email.body          # email body (string, either plaintext or HTML)
email.mailbox_name  # name of the mailbox the email belongs to (string)
```
