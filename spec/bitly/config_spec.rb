# frozen_string_literal: true

RSpec.describe Bitly::Config do
  include Bitly::Config

  describe 'attributes' do
    it 'has api_version attribute.' do
      expect(api_version).to be_nil
      api_version = '4'
      expect(api_version).to eq '4'
    end

    it 'has api_key attribute.' do
      expect(api_key).to be_nil
      api_key = 'some key'
      expect(api_key).to eq 'some key'
    end
  end

  describe '#configure' do
    subject do
      configure do |config|
        config.api_version = '4'
        config.api_key = 'some key'
      end
    end

    it 'returns itself.' do
      is_expected.to eq self
    end

    it 'yield given block.' do
      subject
      expect(api_version).to eq '4'
      expect(api_key).to eq 'some key'
    end
  end
end
