class AddColumnToRooms < ActiveRecord::Migration[7.0]
  def change
    change_table :rooms do |t|
      t.string :name, null: false
      t.text :info, null: false
      t.integer :value, null: false
      t.string :address, null:false
      t.references :user, null: false, foreign_key: true
    end
    add_index :rooms, [:name, :info, :address]
  end
end
