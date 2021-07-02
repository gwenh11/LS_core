=begin
What is wrong with the following code? What fix(es) would you make?

class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    self.expand(3)
  end

  private

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander

# Output
xyzxyzxyz

It is because as of Ruby 2.7, it is legal to call private methods with a literal `self` as the caller.

Otherwise, `Expander@to_s` would have failed, since private methods can never called with an explicit caller,
even when that caller is `self`. Therefore, #expand must be called as follow:

class Expander
  ...
  def to_s
    expand(3)
  end
  ...
end
=end

class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    self.expand(3)
  end

  private

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander