class Type < ApplicationRecord
  has_one :product
  has_and_belongs_to_many :party_guests
end
