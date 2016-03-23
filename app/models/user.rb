require 'bcrypt'

class User
  include DataMapper::Resource

  def password=(password)
    self.password_hash = BCrypt::Password.create(password)
  end

    property :id,            Serial
    property :name,          String
    property :email,         String
    property :password_hash, Text
end
