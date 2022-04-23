class AddColumnToReserves < ActiveRecord::Migration[7.0]
  def change
    change_table :reserves do |t|
      t.integer :user_id
      t.integer :room_id
      t.date :startdate
      t.date :finishdate
      t.integer :member_sum
    end
    add_index :reserves, :user_id
    add_index :reserves, :room_id
    add_index :reserves, [:room_id, :user_id], unique: true
  end
end
