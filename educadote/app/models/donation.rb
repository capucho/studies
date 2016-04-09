class Donation < ActiveRecord::Base
    belongs_to :user
    belongs_to :project, counter_cache: true

    validates_presence_of :value, :user_id, :project_id

    def self.total
        (sum(:value) || 0)
    end
end
