puts "What is your name?"

user_name = gets.chomp

puts "Oh, hi #{user_name}"

# Invoke time method on an integer (10) and pass it to a block. Ruby will iterate through the block 10 times
10.times { puts "Your name is: " + user_name }

puts "What is your first name?"
first_name = gets.chomp

puts "What is your last name?"
last_name = gets.chomp

puts "Your full name is: " + first_name + " " + last_name