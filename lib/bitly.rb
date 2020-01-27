# frozen_string_literal: true

require 'bitly/version'
require 'bitly/config'
require 'bitly/v4'

# Bitly module.
module Bitly
  extend Config

  def self.shorten(long_url, options = {})
    client.shorten(long_url, options)
  end

  class << self
    private

    def client
      validate!
      Bitly::V4::Client.new(access_token: access_token)
    end

    def validate!
      raise StandardError, 'please set api_version.' unless api_version
      raise StandardError, "#{api_version} is not supported." unless api_version == 'v4'
      raise StandardError, 'please set access_token.' unless access_token
    end
  end
end
