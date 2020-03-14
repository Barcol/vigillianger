class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.references :person, foreign_key: true
      t.references :type, foreign_key: true

      t.timestamps
    end
  end
end
