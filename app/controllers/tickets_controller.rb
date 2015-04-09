class TicketsController < ApplicationController
 
  def create
  	puts "In ticket create"
  	puts ticket_params
    @current_user = User.find(params[:ticket][:user_id])
    event = Event.find(params[:ticket][:event_id])
    ticket = Ticket.new(user: @current_user, 
                        event: event, 
                        ticket_type: params[:ticket][:user_role],
                        activity: params[:ticket][:activity], 
    	                  number_of_children: params[:ticket][:number_of_children])
    if ticket.save()
      redirect_to @current_user, notice: "Ticket created."
    else
      redirect_to @current_user, notice: "Ticket creation failed."
    end

  end

  def index
  end

  def ticket_params
  	params.require(:ticket)
          .permit( :user_id, 
                   :event_id, 
                   :user_role,
                   :activity, 
                   :number_of_children)
  end

end
