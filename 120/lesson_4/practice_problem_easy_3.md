# Practice Problems: Easy 3

#### Question 1

If we have this code:

```ruby
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end
```

What happens in each of the following cases:

case 1:

```ruby
hello = Hello.new
hello.hi
```

case 2:

```ruby
hello = Hello.new
hello.bye
```

case 3:

```ruby
hello = Hello.new
hello.greet
```

case 4:

```ruby
hello = Hello.new
hello.greet("Goodbye")
```

case 5:

```ruby
Hello.hi
```

**Solution 1**

case 1:

We invoke `Hello#hi` on the instance of `Hello` class. This method uses the return value of the method `greet` that is inherited from the super class `Greeting`. `greet` takes one string argument, returns the argument and outputs it to the screen. Therefore, the code outputs `Hello`.

case 2:

`undefined method error` occurs. Nether `Hello` class nor its parent class `Greeting` have a `bye` method defined.

case 3:

`ArgumentError`  is raised indicating a wrong number of argument is returned. `Hello` can access its parent class's `greet` method, but `greet` takes an argument which is supplied.

case 4:

We invoke the method `greet`  on the instance of `Hello` class. `Hello` class inherits this method from its parent `Greeting`. This code outputs `Goodbye` to the terminal.

case 5:

Undefined method `hi` is raised for the `Hello` class, because `hi` is defined as an instance method, not a class method. 

------

#### Question 2

In the last question we had the following classes:

```ruby
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end
```

If we call `Hello.hi` we get an error message. How would you fix this?

**Solution 2**

```ruby
class Hello
  def self.hi
    greeting = Greeting.new
    greeting.greet("Hello")
  end
end
```

We make `hi` a class method by adding the `self` in front. Because `greet` is an instance method, so we have to create an instance from the `Greeting` class, before we can use it. The reason it has to be an instance from `Greeting` is `greet` is defined in the super class `Greeting`.



------

#### Question 3

When objects are created they are a separate realization of a particular class.

Given the class below, how do we create two different instances of this class with separate names and ages?

```ruby
class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end
```

**Solution 3**

We can do that by creating two `AngryCat` objects and passing the constructor `initialize` separate values for `age` and `name`. `initialize` is then called upon object creation. These values are assigned to the new object's instance variables, and each object ends up with different information. For example:

```ruby
henry = AngryCat.new(12, "Henry")
alex   = AngryCat.new(8, "Alex")

>> henry.name
Henry
>> henry.age
12
>> alex.name
Alex
>> alex.age
8
```

------

#### Question 4

Given the class below, if we created a new instance of the class and then called `to_s` on that instance we would get something like `"#<Cat:0x007ff39b356d30>"`

```ruby
class Cat
  def initialize(type)
    @type = type
  end
end
```

How could we go about changing the `to_s` output on this method to look like this: `I am a tabby cat`? (this is assuming that `"tabby"` is the `type` we passed in during initialization).

**Solution 4**

By defining `to_s` in `Cat` class to override the existing `to_s` method.

```ruby
class Cat
  attr_reader :type
    
  def initialize(type)
    @type = type
  end
    
  def to_s
    "I am a #{type} cat"
  end
end
```

We can customize existing methods like this easily, but in many cases it might be better to write a new method called something like `display_type` instead, as this is more specific about what we are actually wanting the result of the method to be. An example of this would be:

Copy Code

```ruby
class Cat
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def display_type
    puts "I am a #{type} cat"
  end
end
```

------

#### Question 5

If I have the following class:

```ruby
class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end
```

What would happen if I called the methods like shown below?

```ruby
tv = Television.new
tv.manufacturer
tv.model

Television.manufacturer
Television.model
```

**Solution 5**

`manufacturer` is an class method. `model` is an instance method. 

Line 2 raises `undefined method manufacturer class for #<Television:XXXXX>` error, because we invoke `manufacturer` on the instance of `Television` class instead of the class itself.

Line 6 raises `NoMethodError: undefined method 'model' for Television:Class`, because we call it on a class instead of an instance. 

Line 3 and 5 executes whatever codes `manufacturer` and `model` are defined, as the methods are used appropriately.



------

#### Question 6

If we have a class such as the one below:

```ruby
class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end
```

In the `make_one_year_older` method we have used `self`. What is another way we could write this method so we don't have to use the `self` prefix?

**Solution 6**

`self` in this case is referencing the setter method provided by `attr_accessor` - this means that we could replace `self` with `@`.

```ruby
class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1
  end
end
```



------

#### Question 7

What is used in this class but doesn't add any value?

```ruby
class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end
```

**Solution 7**

There are two things in this class that don't add any values:

1. Using explicit `return` in the `information` method. Ruby automatically returns the result of the last line of any method.
2. `attr_accessor :brightness, :color` is never used, but they give us the option to change brightness color outside of the `Light` class.

