class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  # displays only current events
  def display
    # faking this user as logged in, remove after user completed
    @user = User.find(1)
    @current_events = Event.current
    @events_attendance = @current_events.map{|e| e.current_attendance}

  end

  def verification
    puts "Hitting verfication route"
    respond_to do |format|
      format.json { render json: Event.todays_event.list_of_users }
    end
  end

  def register
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])
    @ticket = Ticket.new
  end

  def show
    @event = Event.find(params[:id])
    @all_tickets = Ticket.where("event_id = #{params[:id]}")
    counter = 0
    @cumulative_ticket_sum = @all_tickets.map{|t| counter += t.number_of_children}
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to event_path(@event)
    else
      flash[:danger] = @event.error.messages
      render :new
    end

  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      flash[:danger] = @event.error.messages
      render :edit
    end
  end


  private

    def event_params
      params.require(:event).permit(:title, :place, :description,
                     "event_date(1i)", "event_date(2i)", "event_date(3i)",
                     :time,
                     :attendance,
                     :activities)

      { title: params[:event][:title],
        place: params[:event][:place],
        description: params[:event][:description],
        event_date: Time.new(params[:event]["event_date(1i)"].to_i,
                             params[:event]["event_date(2i)"].to_i,
                             params[:event]["event_date(3i)"].to_i,
                             params[:event]["event_date(4i)"].to_i,
                             params[:event]["event_date(5i)"].to_i),
       attendance: params[:event][:attendance],
       activities: params[:event][:activities] }
    end

end
