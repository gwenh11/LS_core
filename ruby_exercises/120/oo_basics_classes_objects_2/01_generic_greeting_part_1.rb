=begin
Modify the following code so that Hello! I'm a cat! is printed when Cat.generic_greeting is invoked.

class Cat
end

Cat.generic_greeting

Expected output:
Hello! I'm a cat!

Further Exploration
What happens if you run kitty.class.generic_greeting? Can you explain this result?
kitty = Cat.new
kitty.generic_greeting # => undefined method `generic_greeting' for #<Cat:0x007fbdd3875e40> (NoMethodError)
kitty.class returns the class that kitty belongs to, which is Cat. 
The method `generic_greeting` chained at the end is then invoked on the class Cat. 
This code outputs Hello! I'm a cat!.
=end

class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting
p kitty.class