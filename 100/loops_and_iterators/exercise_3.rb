puts "Enter a number:"
num = gets.chomp.to_i

def count_down (number)
  if number <= 0
    puts number
  else
    puts number
    count_down(number - 1)
  end
end

count_down(num)