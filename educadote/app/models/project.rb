class Project < ActiveRecord::Base
    belongs_to :user
    has_many :items, :dependent => :destroy
    has_many :donations
    scope :most_recent, -> {order('created_at')}

    validates_presence_of :name, :description, :project_type
end
