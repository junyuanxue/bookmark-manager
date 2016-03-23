feature 'user sign up' do
  before do
    visit '/new_user'
    fill_in 'name', with: 'Mittens'
    fill_in 'email', with: 'mittens@gmail.com'
    fill_in 'password', with: 'biscuits'
    click_button 'Sign up'
  end

  scenario 'gets a welcome message' do
    expect(page).to have_content 'Welcome, Mittens'
  end

  scenario 'user count increases' do
    expect(User.count).to eq 1
  end

  scenario 'email address is added to database' do
    user = User.last
    expect(user.email).to eq 'mittens@gmail.com'
  end
end
