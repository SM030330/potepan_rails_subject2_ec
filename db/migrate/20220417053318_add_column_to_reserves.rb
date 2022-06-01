class AddColumnToReserves < ActiveRecord::Migration[7.0]
  def change
    change_table :reserves do |t|
      t.date :startdate, null: false
      t.date :finishdate, null: false
      t.integer :member_sum, null: false
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
    end
  end
end
