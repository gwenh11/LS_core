# 8. Included Modules

**Ruby version 2.4.0 introduced an `Array#min` method not available in prior versions of Ruby; we wrote this exercise before that release. To follow along, please use the documentation for Ruby 2.3.0 [here](http://ruby-doc.org/core-2.3.0/Array.html).**

Use irb to run the following code:

```ruby
a = [5, 9, 3, 11]
puts a.min
```

Find the documentation for the `#min` method and change the above code to print the two smallest values in the `Array`.

A solution that uses the `#min` method alone requires version 2.2.0 or higher of Ruby. If you have an older version of Ruby, you need a different approach.

**Solution**

```ruby
a = [5, 9, 3, 11]
# Pre-2.2.0 versions of Ruby
puts a.sort.take(2)
# Starting version 2.4.0
puts a.min(2)
```

take(n) → new_ary

return first n elements from the array. If n is a negative number, raises `ArgumentError`

Looking documentation for Ruby 2.3.0, `#min` cannot be found in the `Array` class or the parent class `Object`. However, the code still works. 

Some languages have a feature called **multiple inheritance (MI)** - a class can inherit from two or more immediate superclasses, but there are pitfalls. Ruby doesn't allow MI.

Ruby uses **mix-in modules** instead. They provide a way of classes of different types to share behaviors without using inheritance. A class can use a mix-in module by using the `include` method. Once included, all the mix-in's methods become available to object of the class. 

One of the most commonly used mix-ins in Ruby is the `Enumerable` module. It provides much of the functionality needed to iterate through collections such as `Array`, `Hash` and `Range`. 

`#min` is part of the `Enumberable` module. 

min → obj

min { |a, b| block } → obj

min(n) → array

min(n) { |a, b| block } → array

Returns the object in *enum* with the minimum value. The first form assumes all objects implement [Comparable](https://ruby-doc.org/core-2.7.1/Comparable.html); the second uses the block to return *a <=> b*.

Comparable mixin is used by classes whose objects may be ordered. The class must define the <=> operator, which compares the receiver against another object, returning a value less than 0, returning 0, or returning a value greater than 0. If the other object is not comparable than the <=> returns `nil`.

```ruby
a = %w(albatross dog horse)
a.min                                   #=> "albatross"
a.min { |a, b| a.length <=> b.length }  #=> "dog"
```