# frozen_string_literal: true

module Bitly
  # configuration module.
  module Config
    attr_accessor :api_version
    attr_accessor :api_key

    def configure
      yield self
      self
    end
  end
end
