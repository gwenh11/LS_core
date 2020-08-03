# Get input from user and convert to integer
print "Enter a 4-digit number: "
num = gets.chomp.to_i

# Find the 1st digit
digit_1 = num / 1000

# Find the 2nd digit
digit_2 = (num / 100) % 10

# Find the 3rd digit
digit_3 = (num / 10) % 10

# Find the 4th digit
digit_4 = num % 10

# Print results to screen
puts "1st digit is: #{digit_1}"
puts "2nd digit is: #{digit_2}"
puts "3rd digit is: #{digit_3}"
puts "4th digit is: #{digit_4}"