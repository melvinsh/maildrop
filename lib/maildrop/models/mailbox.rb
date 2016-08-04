module Maildrop::Models
  class Mailbox
    attr_reader :name, :emails

    def initialize(name, data)
      @name = name
      emails = JSON.parse(data)
      @emails = emails.map do |email_data|
        http = Maildrop::HTTP.new
        response = http.get("#{name}/#{email_data['id']}")
        Maildrop::Models::Email.new(JSON.parse(response))
      end
    end
  end
end
