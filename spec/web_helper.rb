def sign_up
  visit '/new_user'
  fill_in 'name', with: 'Mittens'
  fill_in 'email', with: 'mittens@gmail.com'
  fill_in 'password', with: 'biscuits'
  fill_in 'confirm_password', with: 'biscuits'
  click_button 'Sign up'
end
