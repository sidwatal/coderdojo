class Event < ActiveRecord::Base
	has_many :tickets
	has_many :users, through: :tickets

	validates :title, presence: true
	validates :description, presence: true
	validates :event_date, presence: true
	validates_numericality_of :number_of_tickets, :only_integer => true, :greater_than => 0
end
