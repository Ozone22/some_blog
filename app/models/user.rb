class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :login, presence: true, length: { minimum: 4, maximum: 50 }
  validates :email, email: true
  validates :password, presence: true, length: { minimum: 6 }, password: true

  def authenticate(password)
    self.valid_password?(password) ? self : false
  end

end
