puts "How old are you?"

age = gets.chomp.to_i

puts "In 10 years you will be: #{age + 10}"
puts "In 20 years you will be: #{age + 20}"
puts "In 30 years you will be: #{age + 30}"
puts "In 40 years you will be: #{age + 40}"

=begin
Cannot do the following:
  puts "In 10 years you will be: " + age + 10
because this is adding string and number (integer) together => Type error
=end