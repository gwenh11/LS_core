# Exercises



## Classes and Objects I

1. Create a class called `MyCar`. When you initialize a new instance or object of the class, allow the user to define some instance variables that tell us the year, color, and model of the car. Create an instance variable that is set to `0` during instantiation of the object to track the current speed of the car as well. Create instance methods that allow the car to speed up, brake, and shut the car off.

   **Solution**

   ```ruby
   class MyCar
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
   end
   
   corolla = MyCar.new(2006, 'Red', 'Toyota Corolla')
   corolla.speed_up(50)
   corolla.current_speed
   corolla.brake(20)
   corolla.current_speed
   corolla.shut_off
   corolla.current_speed
   
   #=> The 2006 Red Toyota Corolla is accelerating at 50 mph.
   #=> The 2006 Red Toyota Corolla is going at 50 mph.
   #=> The 2006 Red Toyota Corolla is decelerating at 20 mph.
   #=> The 2006 Red Toyota Corolla is going at 30 mph.
   #=> The 2006 Red Toyota Corolla is shut off and parked.
   #=> The 2006 Red Toyota Corolla is going at 0 mph.
   ```
   
   
   
2. Add an accessor method to your `MyCar` class to change and view the color of your car. Then add an accessor method that allows you to view, but not modify, the year of your car.

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
   #=> Blue
   #=> 2006
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
   #=> The new black paint job looks great!
   ```



## Classes and Objects II

1. Add a class method to your `MyCar` class that calculates the gas mileage of any car.

   ```ruby
   class MyCar
     # rest of code from previous chapter
       
     def self.gas_mileage(gallons, miles)
       puts "Car uses #{miles/gallons} miles per gallon of gas."
     end
   end
   
   MyCar.gas_mileage(12, 350)
   #=> Car uses 29 miles per gallon of gas.
   ```

   

2. Override the to_s method to create a user friendly print out of your object.

   ```ruby
   class MyCar
     # rest of code from previous chapter
     
     def to_s
       "My car is a #{year} #{color} #{@model}."
     end
   end
   
   my_car = MyCar.new("2015", "Blue", "Honda Civic")
   puts my_car
   #=> My car is a 2015 Blue Honda Civic.
   ```

   

3. When running the following code...

   ```ruby
   class Person
     attr_reader :name
     def initialize(name)
       @name = name
     end
   end
   
   bob = Person.new("Steve")
   bob.name = "Bob"
   ```

   We get the following error...

   ```irb
   test.rb:9:in `<main>': undefined method `name=' for
     #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)
   ```

   Why do we get this error and how do we fix it?

   **Solution**

   The error is raised because `attr_reader` method only creates a getter method. We need a setter method called `name=` to reassign the `name` instance variable to `"Bob"` on line 9. This error can be fixed by changing `attr_reader` to `attr_accessor`. We can also change it to `attr_writer` if we don't intend to use the getter functionality.

   ```ruby
   class Person
     attr_accessor :name
     # or attr_writer :name
     def initialize(name)
       @name = name
     end
   end
   
   bob = Person.new("Steve")
   bob.name = "Bob"
   ```

    

   ## Inheritance

   1. Create a superclass called `Vehicle` for your `MyCar` class to inherit from and move the behavior that isn't specific to the `MyCar` class to the superclass. Create a constant in your `MyCar` class that stores information about the vehicle that makes it different from other types of Vehicles.

      Then create a new class called `MyTruck` that inherits from your superclass that also has a constant defined that separates it from the `MyCar` class in some way.

      **Solution**

      ```ruby
      class Vehicle
        def self.gas_mileage(gallons, miles)
          puts "#{miles / gallons} miles per gallon of gas"
        end
      end
      
      class MyCar < Vehicle
        ENGINE_SIZE = 2
      end
      
      class MyTruck < Vehicle
        ENGINE_SIZE = 6
      end
      ```

      

   2. Add a class variable to your superclass that can keep track of the number of objects created that inherit from the superclass. Create a method to print out the value of this class variable as well.

      **Solution**

      ```ruby
      class Vehicle
        @@number_of_vehicles = 0
          
        def self.number_of_vehicles
          puts "This program has created #{@@number_of_vehicles}"
        end
          
        def initialize
          @@number_of_vehicles += 1
        end
          
        def self.gas_mileage(gallons, miles)
          puts "#{miles / gallons} miles per gallon of gas"
        end
      end
      
      class MyCar < Vehicle
        ENGINE_SIZE = 2
        # code ommited for brevity...
      end
      
      class MyTruck < Vehicle
        ENGINE_SIZE = 6
      end
      ```

      

   3. Create a module that you can mix in to ONE of your subclasses that describes a behavior unique to that subclass.

      **Solution**

      ```ruby
      module Towable
        def can_tow?(pounds)
          pounds < 2000 ? true : false
        end
      end
      
      class Vehicle
        @@number_of_vehicles = 0
      
        def self.number_of_vehicles
          puts "This program has created #{@@number_of_vehicles} vehicles"
        end
      
        def initialize
          @@number_of_vehicles += 1
        end
      
        def self.gas_mileage(gallons, miles)
          puts "#{miles / gallons} miles per gallon of gas"
        end
      end
      
      class MyCar < Vehicle
        ENGINE_SIZE = 4
        #code omitted for brevity...
      end
      
      class MyTruck < Vehicle
        include Towable
      
        ENGINE_SIZE = 6
      end
      ```

      

   4. Print to the screen your method lookup for the classes that you have created.

      **Solution**

      ```ruby
      puts MyCar.ancestors
      puts MyTruck.ancestors
      puts Vehicle.ancestors
      ```

      

   5. Move all of the methods from the `MyCar `class that also pertain to the `MyTruck` class into the `Vehicle` class. Make sure that all of your previous method calls are working when you are finished.

      **Solution**

      ```ruby
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
      
      MyCar.gas_mileage(12, 350)
      corolla.spray_paint('black')
      puts corolla
      
      puts MyCar.ancestors
      puts MyTruck.ancestors
      puts Vehicle.ancestors
      
      #=> The 2006 Red Toyota Corolla is accelerating at 50 mph.
      #=> The 2006 Red Toyota Corolla is going at 50 mph.
      #=> The 2006 Red Toyota Corolla is decelerating at 20 mph.
      #=> The 2006 Red Toyota Corolla is going at 30 mph.
      #=> The 2006 Red Toyota Corolla is shut off and parked.
      #=> The 2006 Red Toyota Corolla is going at 0 mph.
      #=> Car uses 29 miles per gallon of gas.
      #=> The new black paint job looks great!
      #=> My car is a 2006 black Toyota Corolla.
      #=> MyCar
      #=> Vehicle
      #=> Object
      #=> Kernel
      #=> BasicObject
      
      #=> MyTruck
      #=> Towable
      #=> Vehicle
      #=> Object
      #=> Kernel
      #=> BasicObject
      
      #=> Vehicle
      #=> Object
      #=> Kernel
      #=> BasicObject
      ```

      

   6. Write a method called `age` that calls a private method to calculate the age of the vehicle. Make sure the private method is not available from outside of the class. You'll need to use Ruby's built-in [Time](http://ruby-doc.org/core-2.1.0/Time.html) class to help.

      **Solution**

      ```ruby
      class Vehicle
        # code omitted for brevity...
        def age
          "Your #{self.model} is #{years_old} years old."
        end
      
        private
      
        def years_old
          Time.now.year - self.year
        end
      end
      
      # code omitted for brevity...
      
      puts corolla.age
      #=> Your Toyota Corolla is 15 years old.
      ```

      

   7. Create a class 'Student' with attributes `name` and `grade`. Do NOT make the grade getter public, so `joe.grade` will raise an error. Create a `better_grade_than?` method, that you can call like so...

      ```ruby
      puts "Well done!" if joe.better_grade_than?(bob)
      ```

      **Solution**

      ```ruby
      class Student
        def initialize(name, grade)
          @name = name
          @grade = grade
        end
      
        def better_grade_than?(other_student)
          grade > other_student.grade
        end
      
        protected
      
        def grade
          @grade
        end
      end
      
      joe = Student.new("Joe", 90)
      bob = Student.new("Bob", 84)
      puts "Well done!" if joe.better_grade_than?(bob)
      ```

      

   8. Given the following code...

      ```ruby
      bob = Person.new
      bob.hi
      ```

      And the corresponding error message...

      ```irb
      NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
      from (irb):8
      from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'
      ```

      What is the problem and how would you go about fixing it?

      **Solution**

      The problem is that the method `hi` is a private method, therefore it is unavailable to the object. We can fix the error by moving the `hi` method above the `private` method call in the class.
