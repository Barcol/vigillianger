class PartyGuest < ApplicationRecord
  belongs_to :melange
  belongs_to :user
  has_many :products
  has_and_belongs_to_many :types
end
