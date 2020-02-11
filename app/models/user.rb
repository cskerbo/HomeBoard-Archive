class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable,
          :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :user_homes
  has_many :homes, through: :user_homes
  has_many :widgets, through: :user_homes

  def self.create_from_google_data(google_data)
    where(provider: google_data.provider, uid: google_data.uid).first_or_create do | user |
      user.email = google_data.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
