# frozen_string_literal: true

class SmsService
  def initialize(number, message)
    @client = Twilio::REST::Client.new(
      ENV.fetch('TWILIO_ACCOUNT_SID', nil),
      ENV.fetch('TWILIO_AUTH_TOKEN', nil)
    )
    @number = number
    @message = message
  end

  def send_sms
    @client.messages.create(
      from: ENV.fetch('TWILIO_PHONE_NUMBER', nil),
      to: @number,
      body: @message
    )
  end
end
