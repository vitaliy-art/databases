require "rubygems"
require "active_record"

module Models
  class Person < ActiveRecord::Base
    validates :name, :address, :birth_date, presence: { strict: true }
    validates :birth_date, format: { with: /[0-9]{4}-[0-9]{2}-[0-9]{2}/ }, length: { is: 10 }, strict: true
    before_create :maybe_assign_id
    has_many :employees

    def maybe_assign_id
      self.id = SecureRandom.uuid if self.id.blank?
    end

    def to_s
      "{ Person: { Id: #{self.id}, Name: #{self.name}, Address: #{self.address}, BirthDate: #{self.birth_date} } }"
    end
  end
end
