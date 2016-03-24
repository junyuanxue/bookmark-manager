feature 'User sign up' do

  before(:each) { sign_up }

  scenario 'User count increases by 1 when user signs up' do
    expect{sign_up}.to change{User.count}.by(1)
  end

  scenario 'Displays welcome message after user signs up' do
    expect(page).to have_content('Welcome Joe')
  end

  scenario 'Email to be stored correctly' do
    expect(User.last.email).to eq('joe@makersacademy.com')
  end
end
