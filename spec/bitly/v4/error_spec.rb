# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Bitly::V4::Error do
  describe '#initialize' do
    subject { described_class.new(status, message) }
    let(:status) { 200 }
    let(:message) { 'message' }

    it do
      err = subject
      expect(err.instance_variable_get(:@status)).to eq 200
      expect(err.to_s).to eq '200 - message'
    end
  end
end
