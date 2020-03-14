class Product < ApplicationRecord
  belongs_to :party_guest
  belongs_to :type
end
