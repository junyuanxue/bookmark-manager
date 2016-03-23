require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

    property :id,            Serial
    property :name,          String
    property :email,         String
    property :password_hash, Text

    attr_reader :password
    attr_accessor :confirm_password
    validates_confirmation_of :password, :confirm => :confirm_password

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end
end
