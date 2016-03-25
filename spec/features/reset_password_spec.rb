feature 'Resetting password' do
  before do
    sign_up
    Capybara.reset!
  end

  def recover_password
    visit '/users/recover'
    fill_in :email, with: 'joe@makersacademy.com'
    click_button 'Submit'
  end

  scenario 'User can see a link to reset password' do
    visit '/sessions/new'
    click_link 'Forgot password'
    expect(page).to have_content 'Please enter your email address'
  end

  scenario 'User is asked to check inbox upon submitting email address' do
    recover_password
    expect(page).to have_content 'Thanks, please check your inbox to recover your password'
  end

  scenario 'Assign a reset token to the user when recovering password' do
    expect { recover_password }.to change { User.first.password_token }
  end

  scenario 'Token cannot be used after an hour' do
    recover_password
    Timecop.travel(60 * 60 * 60) do
      visit "/users/reset_password?token=#{User.first.password_token}"
      expect(page).to have_content 'Your token has expired'
    end
  end

  scenario 'It asks for a new password when token is valid' do
    recover_password
    visit "/users/reset_password?token=#{User.first.password_token}"
    expect(page).to have_content 'Please enter your new password'
  end

  scenario 'Enter a new password with a valid token' do
    recover_password
    visit "/users/reset_password?token=#{User.first.password_token}"
    fill_in :password, with: 'new_pw'
    fill_in :password_confirmation, with: 'new_pw'
    click_button 'Submit'
    expect(page).to have_content 'Please sign in'
  end

  scenario 'Allows sign in after password reset' do
    recover_password
    visit "/users/reset_password?token=#{User.first.password_token}"
    fill_in :password, with: 'new_pw'
    fill_in :password_confirmation, with: 'new_pw'
    click_button 'Submit'
    sign_in(password: 'new_pw')
    expect(page).to have_content 'Welcome Joe'
  end

  scenario 'Alerts user if passwords mismatch' do
    recover_password
    visit "/users/reset_password?token=#{User.first.password_token}"
    fill_in :password, with: 'new_pw'
    fill_in :password_confirmation, with: 'not_new_pw'
    click_button 'Submit'
    expect(page).to have_content 'Password does not match the confirmation'
  end
end
