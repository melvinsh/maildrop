module Maildrop::Models
  class Email
    attr_reader :id, :sender, :subject, :date, :mailbox_name

    def initialize(mailbox_name, data)
      @id = find_id(data)
      @date = find_date(data)
      @sender = find_sender(data)
      @subject = find_subject(data)
      @mailbox_name = mailbox_name
    end

    def body
      http = Maildrop::HTTP.new
      http.get("#{@mailbox_name}/#{@id}/body") # TODO: remove maildrop header!
    end

    private

    def find_id(data)
      data.attr('data-id')
    end

    def find_sender(data)
      data.css('td.sender').text
    end

    def find_subject(data)
      data.css('td.subject').text
    end

    def find_date(data)
      date_string = data.css('td.date').text
      DateTime.parse(date_string)
    end
  end
end
