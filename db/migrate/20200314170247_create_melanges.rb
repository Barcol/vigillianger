class CreateMelanges < ActiveRecord::Migration[5.2]
  def change
    create_table :melanges do |t|
      t.string :name
      t.date :event_date

      t.timestamps
    end
  end
end
