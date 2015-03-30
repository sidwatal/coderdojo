require 'test_helper'

class EventTest < ActiveSupport::TestCase
  
  def setup
  	@event = Event.new(title: "Example Event",
  	                   place: "12 Example Avenue", 
  		                 description: "Our example event for children to get introduced to technology",
  		                 event_date: DateTime.now,
  		                 attendance: 30)
  end

  test "should be valid" do
    assert @event.valid?  	
  end

  test "event should have title" do 
  	assert @event.title = "  "
  	assert_not @event.valid?
  end

  test "event should have description" do 
  	assert @event.description = "  "
  	assert_not @event.valid?
  end

  test "event should have date" do 
  	assert @event.event_date = "  "
  	assert_not @event.valid?
  end

  test "event should have number of tickets, greater than 0" do
  	assert @event.attendance = 0
  	assert_not @event.valid?
  end

end
