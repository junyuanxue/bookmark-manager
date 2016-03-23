feature 'user sign up' do

  before do
    visit '/new_user'
    fill_in 'name', with: 'John'
    fill_in 'email', with: 'john@gmail.com'
    fill_in 'password', with: 'mynameisjohn'
    click_button 'Sign up'
  end

  scenario 'gets a welcome message' do
    expect(page).to have_content "Welcome John!"
  end

  scenario 'user count increases' do
    expect(User.count).to eq 1
  end

  scenario 'email address is added to database' do
    user = User.last
    expect(user.email).to eq "john@gmail.com"
  end
end
