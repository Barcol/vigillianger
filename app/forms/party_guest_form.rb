class PartyGuestForm < Rectify::Form
  attribute :first_name, String
  attribute :last_name,  String

  validates :first_name, :last_name, :presence => true
end
