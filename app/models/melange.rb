class Melange < ApplicationRecord
  has_many :party_guests
  has_many :types
end
