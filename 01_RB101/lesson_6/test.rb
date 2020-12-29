puts "What is your name?"
name = gets.chomp

if name.include?('!')
  name = name.delete('!').upcase
  puts "HELLO #{name}. WHY ARE WE SCREAMING?"
else
  name = name.capitalize
  puts "Hello #{name}."
end