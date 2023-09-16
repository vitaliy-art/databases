require "rubygems"
require "active_record"

module Models
  class Department < ActiveRecord::Base
    validates :name, presence: { strict: true }
    has_many :employees

    def to_s
      "{ Department: { Id: #{self.id}, Name: #{self.name} } }"
    end
  end
end
