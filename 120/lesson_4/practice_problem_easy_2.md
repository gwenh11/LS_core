# Practice Problems: Easy 2

#### Question 1

You are given the following code:

```ruby
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end
```

What is the result of executing the following code:

```ruby
oracle = Oracle.new
oracle.predict_the_future
```

**Solution** 

We create an instance of the `Oracle` class and assign it to the variable `oracle` on line 1. 

We then call `predict_the_future` method on `oracle` object on line 2. Lines 2-4, method `predict_the_future` is defined. When this method is called, a string is returned in the form of `"You will "` concatenated with the return value of `choices.sample`. Lines 6-7 defines method `choices`, which returns an array consisting of three strings. When `sample` is invoked on `choices`, the method randomly selects one of the three phrases and return it. Overall, the result of line 2 is `"You will <something>"`, where something is one of the 3 phrases defined in the array returned by the `choices` method. 

**Shorter explanation by LS:**

Each time you call, a string is returned which will be of the form `"You will <something>"`, where the something is one of the 3 phrases defined in the array returned by the `choices` method. The specific string will be chosen randomly.



------

#### Question 2

We have an `Oracle` class and a `RoadTrip` class that inherits from the `Oracle` class.

```ruby
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end
```

What is the result of the following:

```ruby
trip = RoadTrip.new
trip.predict_the_future
```

**Solution**

We create an instance of the `Roadtrip` class on line 1. Line 2 returns a string which is in the the form of `"You will <something>"`, where something is one of the 3 phrases defined in the array returned by the `choice` method from the `Roadtrip` class. 

The `Roadtrip` class inherits from the `Oracle` class. This is how we are able to call `Oracle#predict_the_future` on the instance of `Roadtrip` class. However, Ruby looks for a method definition of `choices` in `Roadtrip` before falling back to `Oracle`. It is because every time Ruby tries to resolve a method name, it will start with the methods defined on the class you are calling from. If it doesn't find it, it will go up the hierarchy to look for the methods.

If we were to change the method name of `choices` in `Roadtrip` to something like `chooses`, Ruby will execute `Oracle#choices` because there won't be a `choices` method in `Roadtrip`.



------

#### Question 3

How do you find where Ruby will look for a method when that method is called? How can you find an object's ancestors?

```ruby
module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end
```

What is the lookup chain for `Orange` and `HotSauce`?

**Solution**

Ruby will look for a method in the first class in the chain and eventually look up `BasicObject` if the method is found nowhere in the lookup chain. If the method appears nowhere in the chain then Ruby will raise a `NoMethodError`, which means that a matching method cannot be found anywhere in the chain.

The list of ancestors classes is also called a lookup chain. In order to find an object's ancestors, we can call `ancestors` on it.

```ruby
Orange.ancestors
# method lookup chain
#=> [Orange, Taste, Object, Kernel, BasicObject]
HotSauce.ancestors
#=> [HotSauce, Taste, Object, Kernel, BasicObject]
```



------

#### Question 4

What could you add to this class to simplify it and remove two methods from the class definition while still maintaining the same functionality?

```ruby
class BeesWax
  def initialize(type)
    @type = type
  end

  def type
    @type
  end

  def type=(t)
    @type = t
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end
```

**Solution**

We can replace the getter and setter method for `@type` instance variable with `attr_acessor :type`

```ruby
class BeesWax
  attr_accessor :type
    
  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end
```



------

#### Question 5

There are a number of variables listed below. What are the different types and how do you know which is which?

```ruby
excited_dog = "excited dog"
@excited_dog = "excited dog"
@@excited_dog = "excited dog"
```

**Solution**

`excited_dog` on line 1 is a local variable.

`@excited_dog` on line 2 is an instance variable, indicated by the `@` symbol.

`@@excited_dog` on line 3 is a class variable indicated by the `@@` symbol.



------

#### Question 6

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

Which one of these is a class method (if any) and how do you know? How would you call a class method?

**Solution**

`self.manufacturer` is a class method, because it starts with `self`.

We can call a class method by using the class name and then calling the method. For example, `Television.manufacturer`.



------

#### Question 7

If we have a class such as the one below:

```ruby
class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end
```

Explain what the `@@cats_count` variable does and how it works. What code would you need to write to test your theory?

**Solution**

The `@@cats_count` variable is to keep track of how many cat instances have been created. 

Every time we create a cat using `Cat.new("tabby")`, we create a new instance of the class `Cat`. During the object creation process it will call the `initialize` method and here is where the value of `@@cats_count` variable is incremented.

To test the theory, we can output the value of `@@cats_count` after it has been incremented.

```ruby
def initialize(type)
  @type = type
  @age  = 0
  @@cats_count += 1
  puts @@cats_count
end
```

We can also use `Cat::cats_count` , which returns the total number of cats that are created.



------

#### Question 8

If we have this class:

```ruby
class Game
  def play
    "Start the game!"
  end
end
```

And another class:

```ruby
class Bingo
  def rules_of_play
    #rules of play
  end
end
```

What can we add to the `Bingo` class to allow it to inherit the `play` method from the `Game` class?

**Solution**

We need to add it after `Bingo` class definition.

```ruby
class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end
```

To test this code out we will need to create a new instance of the class `Bingo` and then call the `play` method on that instance

```ruby
>> game_of_bingo = Bingo.new
=> #<Bingo:0x007f9d19b537c8>
>> game_of_bingo.play
=> "Start the game!"
```



------

#### Question 9

If we have this class:

```ruby
class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end
```

What would happen if we added a `play` method to the `Bingo` class, keeping in mind that there is already a method of this name in the `Game` class that the `Bingo` class inherits from.

**Solution**

If we added a `play` method, Ruby will use that method instead of looking up the chain and find the `Game` class's `play` method. 

```ruby
class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end

  def play
    "Eyes down"
  end
end

p Bingo.new.play
#=> "Eyes down"
```



------

#### Question 10

What are the benefits of using Object Oriented Programming in Ruby? Think of as many as you can.

**Solution**

Major benefits:

1. Creating objects allows programmers to think more abstractly about the code they are writing.
2. Objects are represented by nouns so are easier to conceptualize.
3. It allows us to only expose functionality to the parts of the code that need it, meaning namespace issues are much harder to come across.
4. It allows us to easily give functionality to different parts of an application during duplication.
5. We can build application faster as we can reuse pre-written code.
6. As the software becomes more complex this complexity can be more easily managed. 

