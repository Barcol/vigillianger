class CreateConsumePreferences < ActiveRecord::Migration[5.2]
  def change
    create_table :consume_preferences do |t|
      t.belongs_to :party_guest
      t.belongs_to :type

      t.timestamps
    end
  end
end
