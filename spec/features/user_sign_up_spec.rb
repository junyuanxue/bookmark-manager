feature 'User sign up' do

  before(:each) { sign_up }

  scenario 'User count increases by 1 when user signs up' do
    expect { sign_up }.to change { User.count }.by(1)
  end

  scenario 'Displays welcome message after user signs up' do
    expect(page).to have_content('Welcome Joe')
  end

  scenario 'Email to be stored correctly' do
    expect(User.last.email).to eq('joe@makersacademy.com')
  end

  scenario 'No user created when passwords did not match' do
    expect { invalid_sign_up }.not_to change { User.count }
  end

  scenario 'Display message when passwords mismatch' do
    invalid_sign_up
    message = "Passwords did not match"
    expect(page.current_path).to eq '/sign_up'
    expect(page).to have_content(message)
  end
end
