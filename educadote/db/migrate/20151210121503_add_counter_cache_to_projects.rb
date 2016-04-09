class AddCounterCacheToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :items_count, :integer
  end
end
