

puts "Enter a string:"
input = gets.chomp

def caps(string)
  if string.length > 10
    string.upcase
  else
  string
  end
end

puts "String you entered is: #{caps(input)}"