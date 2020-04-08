class Type < ApplicationRecord
  has_many :products
  has_many :consume_preferences
  has_many :party_guests, through: :consume_preferences
  belongs_to :melange
end
