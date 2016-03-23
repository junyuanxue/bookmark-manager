feature 'user sign up' do
  before do
    sign_up
  end

  scenario 'gets a welcome message' do
    expect(page).to have_content 'Welcome, Mittens'
  end

  scenario 'user count increases' do
    expect { sign_up }.to change(User, :count).by(1)
  end

  scenario 'email address is added to database' do
    user = User.last
    expect(user.email).to eq 'mittens@gmail.com'
  end

  scenario 'no new unsers created when a user types in mismatching password' do
    def password_mismatch
      visit '/new_user'
      fill_in 'name', with: 'Fluffy'
      fill_in 'email', with: 'fluffy@gmail.com'
      fill_in 'password', with: 'fish'
      fill_in 'confirm_password', with: 'chips'
      click_button 'Sign up'
    end
    expect { password_mismatch }.not_to change(User, :count)
  end
end
