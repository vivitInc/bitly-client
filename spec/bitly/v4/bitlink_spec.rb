# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Bitly::V4::Bitlink do
  describe '#initialize' do
    subject { described_class.new(data) }
    let(:data) do
      {
        id: 'some id',
        link: 'some link',
        long_url: 'some long url'
      }
    end

    it do
      bitlink = subject
      expect(bitlink.id).to eq 'some id'
      expect(bitlink.short_url).to eq 'some link'
      expect(bitlink.long_url).to eq 'some long url'
    end
  end
end
