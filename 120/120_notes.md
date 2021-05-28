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