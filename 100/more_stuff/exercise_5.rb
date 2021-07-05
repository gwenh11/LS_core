def execute(block)
  block.call
end

execute { puts "Hello from inside the execute method!" }

=begin
Error message:
block.rb1:in `execute': wrong number of arguments (0 for 1) (ArgumentError)
from test.rb:5:in `<main>'
=end

# Error occcurs because a block wasn't passed as an argument