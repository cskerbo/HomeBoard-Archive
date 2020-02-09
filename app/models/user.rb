class User < ApplicationRecord
  has_many :homes
  has_many :widgets, through: :homes
end
