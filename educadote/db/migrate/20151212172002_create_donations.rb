class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
      t.integer :value

      t.timestamps null: false
    end
  end
end
