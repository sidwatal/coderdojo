class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates :ticket_type, presence: true
  validates :activity, presence: true
end

# to create a ticket for a particular user for a particular event
# user.tickets.create(event: e, ticket_type: <ticket_type>, number_of_children: <#>)