# frozen_string_literal: true

RSpec.describe Bitly::Client do
  it 'has a version number' do
    expect(Bitly::Client::VERSION).not_to be nil
  end
end
