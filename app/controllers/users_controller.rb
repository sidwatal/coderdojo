class UsersController < ApplicationController
  def new
  end

  def show
  	@user = User.find(1)
  	@events = Event.where("event_date >=?", Time.now)
  	#@events = Event.all
  end

end
