require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :password_hash, Text

  attr_accessor :password_confirmation
  attr_reader :password
  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end
end
