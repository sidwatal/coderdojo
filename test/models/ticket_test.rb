require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  
  def setup
  	@user = User.new(first_name: "Example", last_name: "User")
  
  	@event = Event.new(event_title: "Example Event",
  	                   event_place: "123 Example Ave.", 
  		               event_description: "Our example event for children to get introduced to technology",
  		               event_date: DateTime.now,
  		               event_number_tickets: 30)
  	@ticket = Ticket.new(event: @event, ticket_type: "regular", number_of_children: 1)
    
  end

  test "ticket is valid" do
    assert @ticket.valid?  	
  end

  test 'User has a ticket' do
    @user.tickets << @ticket

    assert @user.tickets.includes(@ticket)
  end

end
