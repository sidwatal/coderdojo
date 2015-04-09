require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  
  def setup
  	@user = User.new(first_name: "Example", last_name: "User")
  
  	@event = Event.new(title: "Example Event",
  	                   place: "123 Example Ave.", 
  		                 description: "Our example event for children to get introduced to technology",
  		                 event_date: DateTime.now,
                       activities: "Scratch, HTML, Hardware",
  		                 attendance: 30)
  	@ticket = Ticket.new(event: @event, ticket_type: "regular", 
                         activity: "HTML", number_of_children: 1)
    @user.tickets = [@ticket]
  end

  test "should be valid" do
    assert @ticket.valid?  	
  end

  test "ticket should have a type" do
    @ticket.ticket_type = "  "
    assert_not @ticket.valid?
  end

  test "ticket should have an activity" do
    @ticket.activity = " "
    assert_not @ticket.valid?
  end

end
