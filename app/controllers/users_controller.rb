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
    @current_user = User.find(1)  # this simulates logged in user; delete when implemented
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

  # allow only admin
  def index

    if params[:search]
      @users = User.search(params[:search])
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
      render :edit
    end
  end

  def test
    puts params
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end


  def users_registered
    # delete this after debugging
    @all_tickets = Ticket.where("event_id =?", params[:event_id])
    @event = Event.find(params[:event_id])
    @all_users = @event.list_of_users
    @total_attendance = @event.current_attendance
  end

end
