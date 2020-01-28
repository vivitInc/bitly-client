# frozen_string_literal: true

require_relative 'lib/bitly/version'

Gem::Specification.new do |spec|
  spec.name          = 'bitly-client'
  spec.version       = Bitly::VERSION
  spec.authors       = ['shimar']
  spec.email         = ['dev@vivit.co.jp']

  spec.summary       = 'Client library for Bitly API.'
  spec.description   = 'Client library for Bitly API.'
  spec.homepage      = 'https://github.com/vivitInc/bitly-client'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org/'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency     'faraday'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'webmock'
end
