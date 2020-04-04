class RemoveRoleFromPartyGuests < ActiveRecord::Migration[5.2]
  def change
    remove_column :party_guests, :role, :integer
  end
end
