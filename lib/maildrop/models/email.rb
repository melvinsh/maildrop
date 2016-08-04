module Maildrop::Models
  class Email
    def initialize(data)
      @mail = Mail.new(data['body'])
    end

    def sender
      @mail.from.first
    end

    def subject
      @mail.subject
    end

    def date
      @mail.date
    end

    def body
      @mail.body.decoded
    end
  end
end
