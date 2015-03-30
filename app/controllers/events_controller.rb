class EventsController < ApplicationController

  require 'date'

  def new
  	@event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to event_path(@event)
    else
      puts "Not saved event"
      redirect_to new_event_path
    end

  end

  def show
    @events = Event.all
  end

  private

    def event_params
      params.require(:event).permit(:title, :place, :description,
                     "event_date(1i)", "event_date(2i)", "event_date(3i)", 
                     :number_of_tickets)

      { title: params[:event][:title], 
        place: params[:event][:place],
        description: params[:event][:description],
        event_date: Date.new(params[:event]["event_date(1i)"].to_i, 
                             params[:event]["event_date(2i)"].to_i, 
                             params[:event]["event_date(3i)"].to_i),
       number_of_tickets: params[:event][:number_of_tickets] }
    end

end
