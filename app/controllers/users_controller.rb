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
  	@past_events = @user.current_events
  	@current_events = @user.past_events
  end

  def cancel_ticket
    user = User.find(params[:user])
    ticket = Ticket.where("user_id =? and event_id =?", params[:user], params[:event]).first
    ticket_id = ticket.id
    Ticket.destroy(ticket_id)
    redirect_to user_path(user)
  end
<<<<<<< HEAD
  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
=======

  def users_registered
    # delete this after debugging
    @all_tickets = Ticket.where("event_id =?", params[:event_id])
    @event = Event.find(params[:event_id])
    @all_users = @event.list_of_users
    @total_attendance = @event.current_attendance
  end

  # allow only admin
  def index
    if params[:search]
      puts "Searching for a user"
      @users = User.search(params[:search])
      puts @users.count
    else
    @users = User.all
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated successfully"
      redirect_to user_path(@user)
    else
      flash[:danger] = @user.errors.messages
      redner :edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
      # add :password and :password_confirmation when implemented
    end

>>>>>>> d66eeb0a2c151b47d1dfbcb6d34fc3e6be0a7669
end
