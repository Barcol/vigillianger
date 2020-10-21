class PartyGuestForm < Rectify::Form
  attribute :name, String
  attribute :email,  String
  attribute :product_types, Array

  validates :name, :email, :presence => true
end
