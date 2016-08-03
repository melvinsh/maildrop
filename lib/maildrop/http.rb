module Maildrop
  class HTTP
    class NotFound < StandardError; end
    class RequestError < StandardError; end

    def get(url)
      handle_response(request(url))
    end

    private

    def request(url)
      uri = generate_url(url)
      perform_request(uri)
    end

    def perform_request(uri)
      http = Net::HTTP.new(uri.host, uri.port)
      http.get(uri.request_uri)
    end

    def generate_url(url)
      URI("#{base_url}/#{url}")
    end

    def base_url
      'http://maildrop.cc/inbox'
    end

    def handle_response(response)
      case response.code.to_i
      when 200
        response.body
      when 404
        raise NotFound
      else
        raise RequestError, status: response.message, code: response.code
      end
    end
  end
end
