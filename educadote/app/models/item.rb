class Item < ActiveRecord::Base
  belongs_to :project

  validates_presence_of :name, :description, :price

  def self.total
      #TODO: add the quantity
      (sum(:price) || 0)
  end

end
