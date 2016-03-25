feature 'User sign in' do
  before { sign_up }

  scenario 'An existing user can sign in' do
    sign_in
    expect(page).to have_content 'Welcome Joe'
  end

  scenario 'Sign in with incorrect email' do
    sign_in(email: 'j@makers.com')
    expect(page).to have_content 'Incorrect email or password'
  end

  scenario 'Sign in with incorrect password' do
    sign_in(password: 'wrong_password')
    expect(page).to have_content 'Incorrect email or password'
  end
end
