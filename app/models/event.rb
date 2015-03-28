class Event < ActiveRecord::Base
	has_many :tickets
	has_many :users, through: :tickets

	validates :event_title, presence: true
	validates :event_place, presence: true
	validates :event_description, presence: true
	validates :event_date, presence: true
	validates_numericality_of :event_number_tickets, presence: true, numericality: { only_integer: true }, greater_than: 0
end
