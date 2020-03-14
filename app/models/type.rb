class Type < ApplicationRecord
  has_one :product
  has_many :consume_preferences
  has_many :party_guests, through: :consume_preferences
end
