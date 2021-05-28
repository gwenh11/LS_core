module Towable
  def can_tow?(pounds)
    pounds < 2000 ? true : false
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :year, :model
  @@number_of_vehicles = 0

  def self.gas_mileage(gallons, miles)
    puts "Car uses #{miles/gallons} miles per gallon of gas."
  end

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
  end

  def current_speed
    puts "The #{@year} #{@color} #{@model} is going at #{@current_speed} mph."
  end

  def brake(num)
    @current_speed -= num
    puts "The #{@year} #{@color} #{@model} is decelerating at #{num} mph."
  end

  def speed_up(num)
    @current_speed += num
    puts "The #{@year} #{@color} #{@model} is accelerating at #{num} mph." 
  end

  def shut_off
    @current_speed = 0
    puts "The #{@year} #{@color} #{@model} is shut off and parked."
  end

  def spray_paint(color)
    self.color = color
    puts "The new #{color} paint job looks great!"
  end

  def age
    "Your #{self.model} is #{years_old} years old."
  end

  private

  def years_old
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  ENGINE_SIZE = 2
  
  def to_s
    "My car is a #{self.year} #{self.color} #{self.model}."
  end
end

class MyTruck < Vehicle
  include Towable

  ENGINE_SIZE = 6

  def to_s
    "My truck is a #{self.year} #{self.color} #{self.model}."
  end
end

corolla = MyCar.new(2006, 'Red', 'Toyota Corolla')
corolla.speed_up(50)
corolla.current_speed
corolla.brake(20)
corolla.current_speed
corolla.shut_off
corolla.current_speed

# corolla.color = 'Blue'
# puts corolla.color
# puts corolla.year

MyCar.gas_mileage(12, 350)
corolla.spray_paint('black')
puts corolla

# my_car = MyCar.new("2015", "Blue", "Honda Civic")
# puts my_car

puts MyCar.ancestors
puts MyTruck.ancestors
puts Vehicle.ancestors

puts corolla.age