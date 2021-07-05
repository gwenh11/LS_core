# 7. Parent Class

Use irb to run the following code:

```ruby
s = 'abc'
puts s.public_methods.inspect
```

You should find that it prints a list of all of the public methods available to the String `s`; this includes not only those methods defined in the `String` class, but also methods that are inherited from `Object` (which inherits other methods from the `BasicObject` class and the `Kernel` module). That's a lot of methods.

How would you modify this code to print just the public methods that are defined or overridden by the `String` class? That is, the list should exclude all members that are only defined in `Object`, `BasicObject`, and `Kernel`.



**Solution**

```ruby
s = 'abc'
puts s.public_methods(false).inspect
```

The issue here is that ruby is an object oriented language. Every value in Ruby is an object, which means that it has an associated class, and that class in turn has a superclass, or parent. Every class that inherits from a superclass also inherits all of its methods.

`String` parent class is `Object`, every method in `Object` is also available in `String`, though perhaps in modified form. The reason for the modified methods is because a class can override the members of its superclass. For example, `String` overrides `Object#==`. Therefore, you need to look at the class documentation before you check the superclass documentation. 

Looking at `Object#public_methods`, it takes an optional argument `all`. If that values is `true` or omitted, it returns a list of **ALL** public methods available to the object. If `all` is `false`, it only returns a list of methods defined directly in the object class (in this case `String` class)