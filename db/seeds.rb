# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(first_name: "First", last_name: "User", email: "first@example.com")
User.create(first_name: "Second", last_name: "User", email: "second@example.com")
User.create(first_name: "Third", last_name: "User", email: "third@example.com")

Event.create(title: "Second event", place: "Second place", 
	         description: "Second event to acquaint children with technology",
	         event_date: Time.new(2015, 5, 14, 13, 00),
	         attendance: 25)