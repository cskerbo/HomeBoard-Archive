class Home < ApplicationRecord
  has_many :user_homes
  has_many :users, through: :user_homes
  has_many :widgets
end
