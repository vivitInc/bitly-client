# frozen_string_literal: true

module Bitly
  module V4
    # Bitly Client.
    class Client
      BASE_URI = 'https://api-ssl.bitly.com/'
      private_constant :BASE_URI

      def initialize(**args)
        @conn = Faraday.new(BASE_URI)
        @conn.authorization(:Bearer, args[:access_token])
        @conn.headers[:content_type] = 'application/json'
      end

      def shorten(long_url, options = {})
        body = { long_url: long_url }.merge(options)
        response = post('/v4/shorten', body.to_json)
        Bitly::V4::Bitlink.new(JSON.parse(response.body, symbolize_names: true))
      end

      private

      def post(path, body)
        response = @conn.post(path, body)
        raise Bitly::V4::Error.new(response.status, response.body) unless [200, 201].include?(response.status)

        response
      end
    end
  end
end
