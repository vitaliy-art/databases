require "rubygems"
require "active_record"

module Models
  class Employee < ActiveRecord::Base
    before_create :maybe_assign_id
    enum :position, [:Staffer, :Manager, :Boss]
    belongs_to :department
    belongs_to :person
    validates :person, :department, :position, presence: { strict: true }

    def maybe_assign_id
      self.id = SecureRandom.uuid if self.id.blank?
    end

    def to_s
      "{ Employee: { Id: #{self.id}, Person: #{self.person}, Department: #{self.department}, Position: #{self.position} } }"
    end
  end
end
