# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Bitly::V4::Client do
  describe '#initialize' do
    subject { described_class.new(access_token: access_token) }
    let(:access_token) { 'sume token' }

    it do
      client = subject
      expect(client.instance_variable_get(:@conn)).to be_instance_of Faraday::Connection
    end
  end

  describe '#shorten' do
    subject { client.shorten(long_url, options) }
    let(:client) { Bitly::V4::Client.new(access_token: 'some token') }
    let(:long_url) { 'https://www.google.com' }
    let(:options) { {} }

    context do
      before do
        stub_request(:post, 'https://api-ssl.bitly.com/v4/shorten')
          .to_return(body: File.new('spec/fixtures/shorten_200.json'), status: 200)
      end

      it do
        res = subject
        expect(res).to be_instance_of Bitly::V4::Bitlink
        expect(res.id).to eq 'bit.ly/2Oh32A7'
        expect(res.short_url).to eq 'http://bit.ly/2Oh32A7'
        expect(res.long_url).to eq 'https://www.google.com/'
      end
    end

    context do
      before do
        stub_request(:post, 'https://api-ssl.bitly.com/v4/shorten')
          .to_return(body: File.new('spec/fixtures/shorten_403.json'), status: 403)
      end

      it do
        expect { subject }.to raise_error Bitly::V4::Error
      end
    end
  end
end
