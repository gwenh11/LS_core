# 1. Class and Instance Methods

Locate the ruby documentation for methods `File::path` and `File#path`. How are they different?

### **Solution**

Both methods are found on ruby docs page for `File` class in the Core API section. `File::path` is a class method. `File#path` is an instance method. Class methods are called on the class, while **instance methods** are called on **objects**.

# 2. Optional Arguments Redux

Assume you have the following code:

```ruby
require 'date'
# adding Date from the standard library API so it can be used within the program
# civil is a class method
# method new can be used in place of method civil
puts Date.civil #=> -4712-01-01 
puts Date.civil(2016) #=> 2016-01-01 
puts Date.civil(2016, 5) #=> 2016-05-01
puts Date.civil(2016, 5, 13) #=> 2016-05-13
```

What will each of the 4 `puts` statements print? see above

from `::civil` docs:

`civil([year=-4712[, month=1[, mday=1[, start=Date::ITALY]]]]) → date`

Outermost bracket pairs can only be omitted if all innermost bracket pairs are omitted as well. In other words, arguments must be passed from general to the specific. 

On line 5, no arguments passed to method invocation. `year` defaults to `-4712`, `month` defaults to `01`, `mday` defaults to `01`, and `start` defaults to `Date::ITALY` 

One line 6, `year` value is passed as an argument, `month` defaults to `01`, `mday` defaults to `01`, and `start` defaults to `Date::ITALY` 

On line 7, `year` and `month` values are passed as arguments, `mday` defaults to `01`, and `start` defaults to `Date::ITALY` 

On line 8, `year`, `month` and `mday` values are passed as arguments, `start` defaults to `Date::ITALY`

# 3. Default Arguments in the Middle

Consider the following method and a call to that method:

```ruby
def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)
#=> [4, 5, 3, 6]
```

Use the ruby documentation to determine what this code will print.

This can be found in `doc/syntax/calling_methods.doc` under `Default Positional Arguments`. Ruby lets you use default arguments in the middle of number of positional arguments. Documentation shows that positional arguments are filled out first, then default arguments are set with any values supplied, and finally, default values are applied to anything remaining. 

First, `4` is assigned to `a`, `6` is assigned to `d`. Only arguments with default values remain. Since `5` has not been assigned, it is given to `b` (Ruby fills in missing arguments from left to right) and `c` uses default value `3`.

In other words, `4`, `5` and `6` are assigned to the **positional arguments** `a`, `b`, and `d`. `5` overrides the default value for `b` and `c` takes the default value.

# 4. Multiple Signatures

What do each of these `puts` statements output?

Copy Code

```ruby
a = %w(a b c d e)
puts a.fetch(7)
puts a.fetch(7, 'beats me')
puts a.fetch(7) { |index| index**2 }
```