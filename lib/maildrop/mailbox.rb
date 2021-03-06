module Maildrop
  class Mailbox
    class << self
      def get(name)
        build_model(name)
      end

      def random_get
        name = SecureRandom.hex(12)
        build_model(name)
      end

      private

      def build_model(name)
        Maildrop::Models::Mailbox.new(name)
      end
    end
  end
end
