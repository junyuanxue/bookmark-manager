require 'mailgun'

class SendRecoverLink
  def initialize(mailer: nil)
    @mailer = mailer || Mailgun::Client.new(ENV["your_api_key"])
  end

  def self.call(user, mailer=nil)
    new(mailer: mailer).call(user)
  end

  def call(user)
    mailer.send_message(ENV['mailgun_domain_name'],
                      { from: "bookmarkmanager@gmail.com",
                        to: user.email,
                        subject: 'Reset your password',
                        text: "Click here to reset your password http://localhost:9292/reset_password?token=#{user.password_token}" })
  end

  private

  attr_reader :mailer
end
