class Product < ApplicationRecord
  belongs_to :party_guest, optional: true
  belongs_to :type
end
