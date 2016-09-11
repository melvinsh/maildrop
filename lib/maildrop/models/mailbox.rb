module Maildrop::Models
  class Mailbox
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def address
      "#{name}@maildrop.cc"
    end

    def emails
      emails = JSON.parse(mailbox_data)
      emails.map do |email|
        data = download_email(email['id'])
        Maildrop::Models::Email.new(data)
      end
    end

    private

    def mailbox_data
      http = Maildrop::HTTP.new
      http.get(@name)
    end

    def download_email(id)
      http = Maildrop::HTTP.new
      response = http.get("#{@name}/#{id}")
      JSON.parse(response)
    end
  end
end
