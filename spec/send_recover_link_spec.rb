require_relative '../app/lib/send_recover_link'

describe SendRecoverLink do
  let(:user) { double :user, email: 'unit@test.com',
              password_token: 'unittest123' }
  let(:mail_gun_client) { double :mail_gun_client }
  let(:sandbox_domain_name) { ENV['sandbox_domain_name'] }

  it 'Sends a message to mailgun when called' do
    params = { from: 'bookmarkmanager@gmail.com',
               to: user.email,
               subject: 'Reset your password',
               text: "Click here to reset your password http://localhost:9292/reset_password?token=#{user.password_token}" }
    expect(mail_gun_client).to receive(:send_message).with(sandbox_domain_name, params)
    described_class.call(user, mail_gun_client)
  end
end
