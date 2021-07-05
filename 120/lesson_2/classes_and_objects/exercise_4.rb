=begin
Using the class definition from step #3, let's create a few more people -- that is, Person objects.

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

If we're trying to determine whether the two objects contain the same name, how can we compare the two objects?
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
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
p bob.name == rob.name

=begin
# We cannot use bob == rob because that compares whether the two Person objects are the same. 
# We want to compare the two string values of name for the two objects
The above code compares a string with a string. But aren't strings also just objects of String class? If we can't compare two Person objects with each other with ==, why can we compare two different String objects with ==?

str1 = 'hello world'
str2 = 'hello world'

str1 == str2          # => true
What about arrays, hashes, integers? It seems like Ruby treats some core library objects differently. For now, memorize this behavior. We'll explain the underpinning reason in a future lesson.
=end