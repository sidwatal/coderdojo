class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #something
    else
      render 'new'
    end
  end

  def show
  	@user = User.find(params[:id])
  	all_tickets = Ticket.where("user_id =?", params[:id])
  	@past_events = []
  	@current_events = []
  	all_tickets.each do |t|
  	  e = Event.find(t.event_id) 
  	  if e.event_date < Time.now
  	    @past_events << e
  	  else
  	  	@current_events << e
  	  end
  	end	
  end

  def cancel_ticket
    user = User.find(params[:user])
    ticket = Ticket.where("user_id =? and event_id =?", params[:user], params[:event]).first
    ticket_id = ticket.id
    Ticket.destroy(ticket_id)
    redirect_to user_path(user)
  end
  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
