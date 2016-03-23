def sign_up
  visit "/users/new"
  fill_in :name, with: "Mittens"
  fill_in :email, with: "mittens@gmail.com"
  fill_in :password, with: "biscuits"
  click_button "Sign up"
end
