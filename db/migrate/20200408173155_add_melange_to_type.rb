class AddMelangeToType < ActiveRecord::Migration[5.2]
  def change
    add_reference :types, :melange, foreign_key: true
  end
end
