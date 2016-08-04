module Maildrop::Models
  class Mailbox
    attr_reader :name, :emails

    def initialize(name, data)
      @name = name
      emails = JSON.parse(data)
      @emails = emails.map do |email|
        data = download_email(email['id'])
        Maildrop::Models::Email.new(data)
      end
    end

    def address
      "#{name}@maildrop.cc"
    end

    private

    def download_email(id)
      http = Maildrop::HTTP.new
      response = http.get("#{@name}/#{id}")
      JSON.parse(response)
    end
  end
end
