class AddDonationsCounterCacheToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :donations_count, :integer
  end
end
