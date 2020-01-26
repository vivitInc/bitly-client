# frozen_string_literal: true

require 'bitly/version'
require 'bitly/config'
require 'bitly/v4'

module Bitly
  extend Config
  class Error < StandardError; end
end
