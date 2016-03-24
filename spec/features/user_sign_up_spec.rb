feature 'User sign up' do

  context 'Successful sign up' do

    scenario 'User count increases by 1 when user signs up' do
      expect { sign_up }.to change { User.count }.by(1)
    end

    scenario 'Displays welcome message after user signs up' do
      sign_up
      expect(page).to have_content('Welcome Joe')
    end

    scenario 'Email to be stored correctly' do
      sign_up
      expect(User.last.email).to eq('joe@makersacademy.com')
    end
  end

  context 'Invalid sign up: password' do
    scenario 'No user created when passwords did not match' do
      expect { sign_up_with_pw_mismatch }.not_to change { User.count }
    end

    scenario 'Display message when passwords mismatch' do
      sign_up_with_pw_mismatch
      message = "Passwords did not match"
      expect(page.current_path).to eq '/sign_up'
      expect(page).to have_content(message)
    end
  end

  context 'Invalid sign up: email' do
    scenario 'User cannot sign up without entering an email' do
      sign_up_invalid_email
      expect(User.count).to eq 0
    end

    # scenario 'User cannot sign up with invalid email format' do
    #   sign_up_invalid_email(email: 'invalid@email')
    #   expect(User.count).to eq 0
    #   expect(page).to have_content 'Invalid email format'
    # end
    #
    # scenario 'User cannot sign up with an already registered email' do
    #   sign_up
    #   sign_up_invalid_email(email: 'joe@makersacademy.com')
    #   expect(User.count).to eq 1
    #   expect(page).to have_content 'Email already registered'
    # end
  end
end
