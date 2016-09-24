class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  PASSWORD_REGEX = /(?=^.{5,}\z)(?=.*[A-Z])(?=.*\d).*\z/

  validates :login, presence: true, length: { minimum: 4, maximum: 50 }
  validates :email, format: { with: EMAIL_REGEX, message: I18n.t('activerecord.errors.user.attributes.email.wrong_email') }
  validates :password, presence: true, length: { minimum: 6 },
            format: { with: PASSWORD_REGEX, message: I18n.t('activerecord.errors.user.attributes.password.wrong_pass') }

  def authenticate(password)
    self.valid_password?(password) ? self : false
  end

end
