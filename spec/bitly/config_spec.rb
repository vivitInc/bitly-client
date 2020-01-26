# frozen_string_literal: true

RSpec.describe Bitly::Config do
  include Bitly::Config

  describe 'attributes' do
    it 'has api_version attribute.' do
      expect(api_version).to be_nil
      api_version = '4'
      expect(api_version).to eq '4'
    end

    it 'has access_token attribute.' do
      expect(access_token).to be_nil
      access_token = 'some token'
      expect(access_token).to eq 'some token'
    end
  end

  describe '#configure' do
    subject do
      configure do |config|
        config.api_version = '4'
        config.access_token = 'some token'
      end
    end

    it 'returns itself.' do
      is_expected.to eq self
    end

    it 'yield given block.' do
      subject
      expect(api_version).to eq '4'
      expect(access_token).to eq 'some token'
    end
  end
end
