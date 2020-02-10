class User < ApplicationRecord
  has_secure_password
  validates :username, :email, :password, presence: true
  validates_confirmation_of :password
  validates_uniqueness_of :username, :email
  has_many :user_homes
  has_many :homes, through: :user_homes
  has_many :widgets, through: :user_homes
end
