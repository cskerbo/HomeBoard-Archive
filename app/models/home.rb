class Home < ApplicationRecord
  has_many :user_homes
  has_many :users, through: :user_homes
  has_many :widgets
  validates_format_of :zip_code,
                      with: /\A\d{5}-\d{4}|\A\d{5}\z/,
                      message: "should be 12345 or 12345-1234",
                      allow_blank: false
end
