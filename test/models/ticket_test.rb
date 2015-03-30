require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  
  def setup
  	@user = User.new(first_name: "Example", last_name: "User")
  
  	@event = Event.new(title: "Example Event",
  	                   place: "123 Example Ave.", 
  		                 description: "Our example event for children to get introduced to technology",
  		                 event_date: DateTime.now,
  		                 number_of_tickets: 30)
  	@ticket = Ticket.new(event: @event, ticket_type: "regular", number_of_children: 1)
    @user.tickets = [@ticket]
  end

  test "should be valid" do
    assert @user.tickets[0].valid?  	
  end

  test "ticket should have a type" do
    @user.tickets[0].ticket_type = "  "
    assert_not @user.tickets[0].valid?
  end

end
