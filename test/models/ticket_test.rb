require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  
  def setup
  	@user = User.new(first_name: "Example", last_name: "User")
  
  	@event = Event.new(title: "Example Event", 
  		               description: "Our example event for children to get introduced to technology",
  		               event_date: DateTime.now,
  		               number_of_tickets: 30)
  	@user.tickets.new(event: @event, ticket_type: "regular", number_of_children: 1)
  end

  test "should be valid" do
    assert @user.tickets.valid?  	
  end
  
end
