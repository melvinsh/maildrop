module Maildrop
  class HTTP
    class NotFound < StandardError; end
    class RequestError < StandardError; end

    def get(url)
      response = request(url)
      handle_response(response)
    end

    private

    def request(url)
      url = generate_url(url)
      ::HTTP.get(url)
    end

    def generate_url(url)
      "#{base_url}/#{url}"
    end

    def base_url
      'https://maildrop.cc/api/inbox'
    end

    def handle_response(response)
      case response.code.to_i
      when 200
        response.to_s
      when 404
        raise NotFound
      else
        raise RequestError, status: response.message, code: response.code
      end
    end
  end
end
