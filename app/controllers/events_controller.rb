class EventsController < ApplicationController

  def new
  	@event = Event.new
  end

  def create
  	 puts params
  	 # This is what I get
  	 # event"=>{"title"=>"crazy happy event", "place"=>"somewhere crazy", "description"=>"Crazy description of crazy event.", 
  	 #          "event_date(1i)"=>"2015", "event_date(2i)"=>"5", "event_date(3i)"=>"1", "number_of_tickets"=>"44"}, 
  	 #          "commit"=>"Create an event"}


  	 #@event = Event.new(user_params)

  end
end
