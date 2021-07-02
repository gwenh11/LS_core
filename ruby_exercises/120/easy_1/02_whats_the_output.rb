=begin
Take a look at the following code:

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    @name.upcase!
    "My name is #{@name}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

What output does this code print? Fix this class so that there are no surprises waiting in store for the unsuspecting developer.
=end

=begin
Output:
Fluffy
My name is FLUFFY.
FLUFFY
FLUFFY
=end

# Corrected Class
class  Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

=begin
The original #to_s uses String#upcase! which mutates its argument in place.
This cause @name to be modified, which in turn causes name to be modified.
It is because @name and name reference the same object in memory.
=end

=begin
Further Exploration
What would happen in this case?

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name
This code "works" because of that mysterious to_s call in Pet#initialize. However, that doesn't explain why this code produces the result it does. Can you?
=end