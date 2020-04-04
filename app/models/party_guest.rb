class PartyGuest < ApplicationRecord
  belongs_to :user
  belongs_to :melange, optional: true
  has_many :products
  has_many :consume_preferences
  has_many :types, through: :consume_preferences

  def add_type(type)
    ConsumePreference.create(types_id: type.id, party_guests_id: self.id)
  end
end
