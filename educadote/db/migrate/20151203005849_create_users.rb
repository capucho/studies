class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.string :country
      t.string :state
      t.string :city
      t.string :address
      t.string :phone_number
      t.string :user_type
      t.string :password_digest
      t.datetime :confirmed_at
      t.string :confirmation_token
      t.timestamps null: false
    end

    add_index :users, :email, :unique => true
  end
end
