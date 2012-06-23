class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |table|
      table.string :email, null: false
      table.string :password_hash
      table.string :password_salt
      table.string :password_digest

      table.timestamps
    end
  end
end
