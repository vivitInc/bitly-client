# frozen_string_literal: true

require 'bitly/version'
require 'bitly/config'

module Bitly
  extend Config
  class Error < StandardError; end
end
