class Melange < ApplicationRecord
  has_many :party_guests
  accepts_nested_attributes_for :party_guests

  has_many :types
  accepts_nested_attributes_for :types
end
