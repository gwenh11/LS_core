=begin
Continuing with our Person class definition, what does the below print out?

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

Let's add a to_s method to the class:

class Person
  # ... rest of class omitted for brevity

  def to_s
    name
  end
end
Now, what does the below output?

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
See Output
=end

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end

  def to_s
    name
  end
end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
#=> The person's name is: #<Person:0x000055617969c4d8
# It's because we use string interpolation instead of string concatenation.
# In other words, Ruby automatically calls the to_s instance method on the expression between the # and {}
# Ever object in Ruby comes with a to_s inherited from the Object class.
# In this case, it prints out the place in memory of the object that instance variable bob references.
# In order to print out the string value, we need to:
# puts "The person's name is: " + bob.name
# puts "The person's name is: #{bob.name}"

# After adding the to_s method
#=> The person's name is: Robert Smith
# We override the default to_s method that the object inherits