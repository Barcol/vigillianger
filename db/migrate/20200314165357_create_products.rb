class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price, default: 0, null: false
      t.references :party_guest, foreign_key: true
      t.references :type, foreign_key: true

      t.timestamps
    end
  end
end
