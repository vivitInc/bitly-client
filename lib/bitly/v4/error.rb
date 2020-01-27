# frozen_string_literal: true

module Bitly
  module V4
    # Error class.
    class Error < StandardError
      attr_reader :status

      def initialize(status, message)
        @status = status
        super("#{@status} - #{message}")
      end
    end
  end
end
