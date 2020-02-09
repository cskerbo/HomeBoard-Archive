class User < ApplicationRecord
  has_secure_password
  has_many :user_homes
  has_many :homes, through: :user_homes
  has_many :widgets, through: :user_homes
end
