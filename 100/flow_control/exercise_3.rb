puts "Enter a number between 0 and 100:"
input = gets.chomp.to_i

if input < 0
  puts "You entered a negative number!"
elsif input <= 50
  puts "Number is between 0 and 50"
elsif input <= 100
  puts "Number is between 51 and 100"
else 
  puts "Number is above 100"
end

