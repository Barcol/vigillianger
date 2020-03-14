class CreatePartyGuestsAndTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :party_guests_and_types, id: false do |t|
      t.belongs_to :party_guests
      t.belongs_to :types
    end
  end
end
