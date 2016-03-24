module SessionHelpers
  def sign_up
    visit '/sign_up'
    fill_in :name, with: 'Joe'
    fill_in :email, with: 'joe@makersacademy.com'
    fill_in :password, with: 'asd123'
    fill_in :password_confirmation, with: 'asd123'
    click_button 'Sign up'
  end

  def sign_up_with_pw_mismatch
    visit '/sign_up'
    fill_in :name, with: 'Mittens'
    fill_in :email, with: 'mittens@makersacademy.com'
    fill_in :password, with: 'fish'
    fill_in :password_confirmation, with: 'chips'
    click_button 'Sign up'
  end

  def sign_up_invalid_email(email: nil)
    visit '/sign_up'
    fill_in :name, with: 'Mittens'
    fill_in :email, with: email
    fill_in :password, with: 'fish'
    fill_in :password_confirmation, with: 'fish'
    click_button 'Sign up'
  end

  def sign_in(email: 'joe@makersacademy.com', password: 'asd123')
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end
end
