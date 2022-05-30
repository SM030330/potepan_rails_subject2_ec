class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.string :name, default: "user", null: false
      t.text :info
      t.string :email, unique: true, null: false
      t.string :password_digest, null: false
    end
  end
end
