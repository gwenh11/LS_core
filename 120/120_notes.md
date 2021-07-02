Defining a class is similar to defining a method, except for two notable differences:

- When defining a class, the reserved word `class` is used instead of `def`.
- When naming a class, the `CamelCase` format is used instead of the `snake_case` format.

Classes, like methods, also use the reserved word `end` to finish the definition.



To instantiate a new object, we use the class method `::new`. This method returns a new instance of the class it was invoked upon. To make use of this new object, we need to assign it to a variable. This variable can be used to interact with the object in various ways.

To add `#initialize` method, we define it with the reserved keyword `def`. Adding this method lets us execute certain statements when a new class object is initialized.

To accept arguments upon initialization, we need to add a parameter to `#initialize`

Instance variables are variables that exist only within an object instance. They are available to reference only once the object has been initialized. They're differentiated by the `@` symbol prepended to their name.



Instance methods are written the same as any other method, except they're only available when there's an instance of the class. For example, `kitty` is an instance of the `Cat` class. This means, if we add the `#greet` method, we're able to invoke it, like this:

```ruby
kitty = Cat.new('Sophie')
kitty.greet # => Hello! My name is Sophie!
```

As mentioned in the previous exercise, the instance variable, `@name`, can be accessed anywhere in the object. This lets us print `Hello! My name is Sophie!` from `#greet` simply by moving the statement from `#initialize` to `#greet`.



Both of these code examples do the exact same thing, however, the second example is preferred due to its simplicity. A getter method not only lets us invoke `#name` inside the class, like this:

Copy Code

```ruby
puts "Hello! My name is #{name}!"
```

but it also lets us invoke `#name` outside the class via the object:

Copy Code

```ruby
kitty.name # => Sophie
```

Setter methods are created similarly to getter methods. Manually, they look the same except with an added `=` in the name and a parameter:

Like getter methods, setter methods can be invoked on the object.

Modules are typically used to contain methods that may be useful for multiple classes, but not all classes. When you mix a module into a class, you're allowing the class to invoke the contained methods.

In our solution, we create a module named `Walkable` that contains a method named `#walk`. We give `Cat` access to this method by including `Walkable` in the class, like this:

Copy Code

```ruby
module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  include Walkable
end
```

This lets us invoke `#walk` on any instance of `Cat`. In this case, if we invoke `kitty.walk`, then `Let's go for a walk!` will be printed.

When looking at the initial example, the first thing you should notice is the invocation of `#generic_greeting`. It's being invoked on the `Cat` class, not an instance of `Cat`. This indicates that `#generic_greeting` is a class method.

Class methods are defined differently than instance methods. When defining a class method, the method name is prepended with `self`, like this: `self.generic_greeting`. In the solution, `self` refers to the `Cat` class. This means we could also define `#generic_greeting` as `Cat.generic_greeting`. However, `self` is preferred when defining class methods.

Like instance methods, we can place any statement we want inside a class method. In our solution, we place `puts 'Hello! I'm a cat!'` so that `Hello! I'm a cat!` is printed when `#generic_greeting` is invoked.

To invoke class methods, they must be called on the class itself, not an instance of the class. If we invoke a class method on an instance of the class, we'll get a `NoMethodError`:

Copy Code

```ruby
class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

kitty = Cat.new
kitty.generic_greeting # => undefined method `generic_greeting' f
```

In the last two exercises, we used `self` to define class methods and to modify instance variables. `self` is used because it refers to the calling object. This means that, in our solution, invoking `self` is the same as invoking `kitty`.

Copy Code

```ruby
p kitty.identify # => #<Cat:0x007f932b06dba8 @name="Sophie">
p kitty          # => #<Cat:0x007f932b06dba8 @name="Sophie">
```

We use `#p` to print the object so that `#inspect` is called, which lets us view the instance variables and their values along with the object.

There are a few differences between class methods and instance methods, however, most notably, class methods are only associated with the class itself, not any instance of the class. Within class methods, we're restricted from adding data specific to objects of the class, like adding a name to an instance of `Cat`. Think of class methods as generic actions a class may perform, like this:

Copy Code

```ruby
class Cat
  def self.speak
    puts 'Meow!'
  end
end

Cat.speak # => Meow!
```

Protected methods are very similar to private methods. The main difference between them is protected methods allow access between class instances, while private methods don't. If a method is protected, it can't be invoked from outside the class. This allows for controlled access, but wider access between class instances.

A namespace provides a container to hold things like functions, classes and constants as a way to group them together logically and to help avoid conflicts with functions and classes with the same name that have been written by someone else.

In Ruby this is achieved using modules.