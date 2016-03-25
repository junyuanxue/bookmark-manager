require_relative '../app/models/user'

describe User do
  let(:user) do
    User.create(name: 'test', email: 'test@test.com',
                password: 'testing123', password_confirmation: 'testing123')
  end

  describe 'authenticate' do
    it 'authenticates when given a valid email and password' do
      auth_user = User.authenticate(user.email, user.password)
      expect(auth_user).to eq user
    end

    it 'does not authenticates when given a wrong password' do
      expect(User.authenticate(user.email, 'wrong_password')).to eq nil
    end
  end

  describe '#generate_token' do
    it 'saves a password recovery token when we generate a token' do
      expect { user.generate_token }.to change { user.password_token }
    end

    it 'saves a password recocery token time' do
      Timecop.freeze do
        user.generate_token
        expect(user.password_token_time).to eq Time.now
      end
    end

    it 'can find a user with a valid token' do
      user.generate_token
      expect(User.find_by_valid_token(user.password_token)).to eq user
    end

    it 'fails to find a user with a token over 1 hour in the future' do
      user.generate_token
      Timecop.travel (60 * 60 + 1) do
        expect(User.find_by_valid_token(user.password_token)).to eq nil
      end
    end
  end
end
