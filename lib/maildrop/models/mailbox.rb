module Maildrop::Models
  class Mailbox
    attr_reader :name, :emails

    def initialize(name, data)
      @name = name
      emails = Nokogiri::HTML(data).css('tr').drop(1)
      @emails = emails.map do |email_data|
        Maildrop::Models::Email.new(name, email_data)
      end
    end
  end
end
