# frozen_string_literal: true

module Bitly
  module V4
    # Bitlink.
    class Bitlink
      attr_accessor :id, :short_url, :long_url

      def initialize(data)
        @id = data[:id]
        @short_url = data[:link]
        @long_url  = data[:long_url]
      end
    end
  end
end
