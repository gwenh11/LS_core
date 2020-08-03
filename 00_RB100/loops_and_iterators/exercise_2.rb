input = ""

while input != 'STOP' do
  puts "Enter a phrase:"
  answer = gets.chomp
  puts "Enter 'STOP' to stop."
  input = gets.chomp
end