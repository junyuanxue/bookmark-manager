def sign_up
  visit '/sign_up'
  fill_in :name, with: 'Joe'
  fill_in :email, with: 'joe@makersacademy.com'
  fill_in :password, with: 'asd123'
  click_button 'Sign up'
end
