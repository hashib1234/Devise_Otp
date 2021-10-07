class User < ApplicationRecord
 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :two_factor_authenticatable,
         :otp_secret_encryption_key => Rails.application.secrets.otp_secret_encryption_key || SecureRandom.hex(16)

  before_save :ensure_authentication_token


  validates :phone,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 15 }
  validates_presence_of :email, :encrypted_password


  def ensure_authentication_token
    self.authentication_token ||= generate_authentication_token
  end


  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
  
end
