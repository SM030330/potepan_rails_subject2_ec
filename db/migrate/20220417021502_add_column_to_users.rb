class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.string :name, default: "user"
      t.text :info
      t.string :email, unique: true, null: false
      t.string :password_digest, null: false
      t.boolean :login_acitve, defulte: false
    end
  end
end
