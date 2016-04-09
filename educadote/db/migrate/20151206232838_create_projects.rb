class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :project_type
      t.text :description
      t.integer :user_id

      t.timestamps null: false
    end

    add_index :projects, :user_id
  end
end
