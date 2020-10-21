class PartyGuestForm < Rectify::Form
  attribute :name, String
  attribute :email,  String
  attribute :product_type_ids, Array

  validates :name, :email, :presence => true
end
