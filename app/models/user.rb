require 'bcrypt'
require 'dm-validations'
require 'securerandom'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String,
            format: :email_address,
            required: true,
            unique: true
  property :password_hash, Text
  property :password_token, Text
  property :password_token_time, Time

  attr_accessor :password_confirmation
  attr_reader :password
  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    return user if user && BCrypt::Password.new(user.password_hash) == password
    nil
  end

  def generate_token
    self.password_token = SecureRandom.hex
    self.password_token_time = Time.now
    self.save
  end

  def self.find_by_valid_token(token)
    user = first(password_token: token)
    user if (user && user.password_token_time + (60 * 60) > Time.now)
  end
end
