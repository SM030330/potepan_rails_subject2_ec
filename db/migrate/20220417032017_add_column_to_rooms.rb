class AddColumnToRooms < ActiveRecord::Migration[7.0]
  def change
    change_table :rooms do |t|
      t.string :name
      t.text :info
      t.integer :value
      t.string :address
      t.references :user, null: false, foreign_key: true
    end
    add_index :rooms, :name
    add_index :rooms, :info
    add_index :rooms, :address
  end
end
