# frozen_string_literal: true

RSpec.describe Bitly do
  it 'has a version number' do
    expect(Bitly::VERSION).to eq '0.1.0'
  end

  describe '#shorten' do
    subject { described_class.shorten(long_url, options) }
    let(:long_url) { 'https://www.google.com' }
    let(:options) { {} }

    context do
      before do
        stub_request(:post, 'https://api-ssl.bitly.com/v4/shorten')
          .to_return(body: File.new('spec/fixtures/shorten_200.json'), status: 200)

        described_class.configure do |config|
          config.api_version = 'v4'
          config.access_token = 'some token'
        end
      end

      it { is_expected.to be_instance_of Bitly::V4::Bitlink }
    end

    context 'when api_version not set,' do
      before do
        described_class.configure do |config|
          config.api_version = nil
          config.access_token = 'some token'
        end
      end
      it { expect { subject }.to raise_error('please set api_version.') }
    end

    context 'when api_version is not v4,' do
      before do
        described_class.configure do |config|
          config.api_version = 'v3'
          config.access_token = 'some token'
        end
      end
      it { expect { subject }.to raise_error('v3 is not supported.') }
    end

    context 'when access_token not set,' do
      before do
        described_class.configure do |config|
          config.api_version = 'v4'
          config.access_token = nil
        end
      end
      it { expect { subject }.to raise_error('please set access_token.') }
    end
  end
end
