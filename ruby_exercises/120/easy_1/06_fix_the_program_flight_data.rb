=begin
Consider the following class definition:

class Flight
  attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end
There is nothing technically incorrect about this class, but the definition may lead to problems in the future. How can this class be fixed to be resistant to future problems?

Hint:
Consider what might happen if you leave this class defined as it is, and later decide to alter the implementation so that a database is not used.
=end

lass Flight
  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

=begin
The solution is to remove attr_accessor :database_handle
The problem is we are providing easy access to the @database_handle instance variable, which is only just an implementation detail.
As a implementation detail, users of this class should have no need for it,
we should not providing direct access to it. Thefore, don't provide the unwanted and unndeeded attr_accessor.

If we provide access to @database_handle and someone uses it, future modifications to the class may break that code.
We may even be prevented from modifying the class at all if the dependent code if of greater concern.
=end