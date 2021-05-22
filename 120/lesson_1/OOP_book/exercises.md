# Exercises



## Classes and Objects I

1. Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define some instance variables that tell us the year, color, and model of the car. Create an instance variable that is set to `0` during instantiation of the object to track the current speed of the car as well. Create instance methods that allow the car to speed up, brake, and shut the car off.

   **Solution**

   ```ruby
   class MyCar
     def initialize(y, c, m)
       @year = y
       @color = c
       @model = m
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
   end
   
   corolla = MyCar.new(2006, 'Red', 'Toyota Corolla')
   corolla.speed_up(50)
   corolla.current_speed
   corolla.brake(20)
   corolla.current_speed
   corolla.shut_off
   corolla.current_speed
   
   # Output
   # The 2006 Red Toyota Corolla is accelerating at 50 mph.
   # The 2006 Red Toyota Corolla is going at 50 mph.
   # The 2006 Red Toyota Corolla is decelerating at 20 mph.
   # The 2006 Red Toyota Corolla is going at 30 mph.
   # The 2006 Red Toyota Corolla is shut off and parked.
   # The 2006 Red Toyota Corolla is going at 0 mph.
   ```

   

2. Add an accessor method to your MyCar class to change and view the color of your car. Then add an accessor method that allows you to view, but not modify, the year of your car.

   **Solution**

   ```ruby
   class MyCar
     attr_accessor :color
     attr_reader :year
       
     # rest of code from question 1
   end
   
   corolla.color = 'Blue'
   puts corolla.color
   puts corolla.year
   
   # Output
   # Blue
   # 2006
   ```

   

3. You want to create a nice interface that allows you to accurately describe the action you want your program to perform. Create a method called `spray_paint` that can be called on an object and will modify the color of the car.

   **Solution**
   
   ```ruby
   class MyCar
     attr_accessor :color
     attr_reader :year
       
     # rest of code from question 1
     
     def spray_paint(color)
       self.color = color
       puts "The new #{color} paint job looks great!"
     end
   end
   
   corolla.spray_paint('black')
   # Output
   # The new black paint job looks great!
   ```



**Code After Updates**

```ruby
class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
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
end
```

