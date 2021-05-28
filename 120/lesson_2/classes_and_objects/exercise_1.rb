=begin
Given the below usage of the Person class, code the class definition.

bob = Person.new('bob')
bob.name                  # => 'bob'
bob.name = 'Robert'
bob.name                  # => 'Robert'
=end

class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

bob = Person.new('bob')
p bob.name
bob.name = 'Robert'
p bob.name

=begin
Solution that doesn't use Ruby built-in attr_accessor

class Person
  # attr_accessor :name
  def get_name
    @name
  end

  def set_name=(name)
    @name = name
  end

  def initialize(name)
    @name = name
  end
end

bob = Person.new('bob')
p bob.get_name
bob.set_name = 'Robert'
p bob.get_name
=end