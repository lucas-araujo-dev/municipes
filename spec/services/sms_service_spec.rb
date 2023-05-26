# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SmsService do
  describe '#send_sms' do
    let(:number) { '+551199999999' }
    let(:message) { 'Test message' }

    it 'sends an SMS using Twilio' do
      client = instance_double(Twilio::REST::Client)
      messages = instance_double(Twilio::REST::Api::V2010::AccountContext::MessageList)
      allow(Twilio::REST::Client).to receive(:new).and_return(client)
      allow(client).to receive(:messages).and_return(messages)
      expect(messages).to receive(:create).with(from: ENV.fetch('TWILIO_PHONE_NUMBER', nil), to: number, body: message)

      described_class.new(number, message).send_sms
    end
  end
end
