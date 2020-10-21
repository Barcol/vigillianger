class ConsumePreference < ApplicationRecord
  belongs_to :party_guest, inverse_of: :consume_preferences
  belongs_to :type, inverse_of: :consume_preferences
end
