class ConsumePreference < ApplicationRecord
  belongs_to :party_guest
  belongs_to :type
end
