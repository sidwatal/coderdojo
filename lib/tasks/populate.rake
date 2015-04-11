namespace :db  do 
  desc "Erase and fill database"
  task :populate => :environment do 
  	require 'populator'
  	require 'faker'

  	[Event, User, Ticket].each(&:delete_all)
    activities = ["Scratch", "HTML", "Hardware"]

  	Event.populate 10 do |event|
  	  event.title = Populator.words(1..5).titleize
  	  event.place = Faker::Address.street_address
  	  event.description = Populator.words(1..10).titleize
      event.activities = activities.join(', ')
  	  event.event_date = Faker::Time.between(20.days.ago, Faker::Time.forward(20, :evening))
  	  event.attendance =  Faker::Number.number(2)
  	end

  	User.populate 20 do |user|
  		user.first_name = Faker::Name.first_name
  		user.last_name = Faker::Name.last_name
  		user.email = Faker::Internet.email
        r = Random.rand(100)
  		if r < 85
  		  user.role = "parent" 
  		else
  		  user.role = "mentor"
  		end
  		Ticket.populate 1..5 do |ticket|  
  			e = Random.rand(10) + 1
  			ticket.user_id = user.id
            ticket.event_id = e
            ticket.ticket_type = "regular"
            ticket.activity = activities[Random.rand(3)]
            ticket.number_of_children = Random.rand(3) + 1
        end
  	end
	end
end