class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
         
  def self.authenticate(username, password)
    user = User.find_for_authentication(:email => username)
    user.valid_password?(password) ? user : nil
  end
  has_many :tasks
end
