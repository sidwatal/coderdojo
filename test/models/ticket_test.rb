require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  
  def setup
  	@user = User.new(first_name: "Example", last_name: "User")
  
  	@event = Event.new(title: "Example Event",
  	                   place: "123 Example Ave.", 
  		                 description: "Our example event for children to get introduced to technology",
  		                 event_date: DateTime.now,
  		                 attendance: 30)
  	@ticket = Ticket.new(event: @event, ticket_type: "regular", number_of_children: 1)
    @user.tickets = [@ticket]
  end

  test "should be valid" do
    assert @tickets.valid?  	
  end

  test "ticket should have a type" do
    @ticket.ticket_type = "  "
    assert_not @ticket.valid?
  end

end
