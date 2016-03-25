require_relative '../app/models/user'

describe User do
  let(:user) do
    User.create(name: 'test', email: 'test@test.com', password: 'testing123', password_confirmation: 'testing123')
  end

  describe '#authenticate' do
    it 'authenticates when given a valid email and password' do
      auth_user = User.authenticate(user.email, user.password)
      expect(auth_user).to eq user
    end

    it 'does not authenticates when given a wrong password' do
      expect(User.authenticate(user.email, 'wrong_password')).to eq nil
    end
  end
end
