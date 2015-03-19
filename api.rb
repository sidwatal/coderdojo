# https://api.github.com/sdjukic/Blabber/issues

require 'open-uri'
require 'json'

uri = open('https://api.github.com/users/sdjukic/repos')
body = uri.read
obj = JSON.parse body

puts "There are #{obj.size} repositiories under this organization."

obj.each_with_index do |item, index|
	puts index+1
	#puts "Repository name: #{item['name']}"
	#puts "Repository description: #{item['description']}"
  puts item['full_name']

end
