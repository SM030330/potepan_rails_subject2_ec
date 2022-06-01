class CreateReserves < ActiveRecord::Migration[7.0]
  def change
    create_table :reserves do |t|
      t.timestamps
    end
  end
end
