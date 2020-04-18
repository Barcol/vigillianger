class PartyGuest < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :melange, optional: true
  has_many :products
  has_many :consume_preferences
  has_many :types, through: :consume_preferences

  validates :name, presence: true

  attr_accessor :email
  attr_accessor :role

  def add_type(type)
    ConsumePreference.create(types_id: type.id, party_guests_id: self.id)
  end

end
