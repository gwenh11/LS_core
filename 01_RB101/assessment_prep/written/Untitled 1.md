# Code Snippets

line 1 -> I would make the distincition between argument & parameters. Value is a parameter here, not an argument. On line 7 the argument is passed in via the variable s.
line 2 -> I would also add here that the << operator mutates the caller (value)
line 3 -> I would say that it reassigns the variable value (instead of just 'assigns')

(From Srdjan's article: https://medium.com/how-i-started-learning-coding-from-scratch/advice-for-109-written-assessment-part-2-594060594f6e)

## Snippet 1:

```ruby
a = 'hello'
b = a
a = 'goodbye'
```

One `line 1`, local variable `a` is initialized to String `'hello'`. 

On `line 2`, local variable `b` is initialized to the String object that the local variable `a` is referencing. Currently, both local variables `a` and `b` are pointing to the same object. 

On `line 3`, local variable `a` is reassigned to the String `'goodbye'`. The local variable `a` is now pointing to the String `'goodbye'`, but local variable `b` is still pointing to the String `'hello'`.

### Further explanation for `line 1`:

One `line 1`, local variable `a` is initialized and assigned to the String object `'hello'`. Local variable `a` now references the string object `'hello'`.



## Snippet 2:

```ruby
def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    # this is syntactical sugar for
    # i = i - 1
    # which is i = i.(-1)
    break if i == 0
  end
end

example('hello')
```

on `line 1-8`, method `example` is defined and takes one parameter. On `line 10`, method `example` is called with the String `'hello'` is passed to it as an argument. 

On `line 2`, local variable `i` is initialized to the Integer `3`.

On `line 3`, method `loop` is invoked with the `do..end` block is passed to it as an argument. 

On `line 4`, method `puts` is called with the local variable `str` passed to it as an argument.

On `line 5`, local variable `i` is reassigned to the return value of method call `Integer#-` on a local variable `i` with integer `1` passed to its as an argument.

On `line 6`, method `loop` is broken by the keyword `break` if the value of the object that local variable `i` is referencing is equal to `0`.

This code outputs the String `'hello'` 3 times and returns `nil`. 

The last evaluated expression is returned, since we don't have an explicit `return` inside the method definition. The last evaluated expression is `break if i == 0`, which returns `nil` in this case.



## Snippet 3 - variable scoping:

```ruby
a = 4
# to eliminat the error: b = nil

loop do
  a = 5
  b = 3
  break
end

puts a
puts b
```

This code outputs `5` and raises an error `undefined local variable or method` `b`. 

Method `loop` invocation with the `do..end` block creates an inner scope, within which local variable `b` is initialized to the Integer `3`. Local variable `b` cannot be accessed outside of method `loop` invocation. However, local variable `a` is initialized the Integer 4 outside of method `loop` invocation; therefore, local variable `a` can be accessed inside method `loop` invocation.

whereas a variable initialized in the inner scope created by a block following method invocation (in this case `b`) is not available in the outer scope.

## Snippet 3 - variable scoping:

```ruby
a = 4
b = 2

loop do
  c = 3
  a = c
  break
end

puts a
puts b
```

This code outputs `2` and `3` respectively.

On `line 1`, local variable `a` is initialized to the Integer `4`. On `line 4-8`, method `loop` invocation with the `do..end` block passed to it as an argument. The `do..end` block creates an inner scope. Within this scope, local variable `c` is initialized to the Integer `3` (on `line 5`), and local variable `a` is reassigned to the same value as local variable `c` is pointing to (on `line 6`). On `line 10`, `puts` method is called with local variable `a` passed to it as an argument. This output the value of local variable `a`, which is now `3`. Local variable `a` is defined outside of the `loop` method invocation, thus can be accessed inside method `loop` and its value can be reassigned.  

On `line 2`, local variable `b` is initialized to the Integer `2`. On `line 11`, `puts` method is invoked with local variable `b` passed to it as an argument. This outputs `2` to screen.

If `puts c` is added on `line 12`, it will raise an error, as variable `c` is not available in the outer scope (outside of method `loop` invocation).

This demonstrates local variable scoping rules whereby a variable initialized in the outer scope (in this case `a`) is available in the inner scope created by a block following method invocation.  



## Snippet 4 - variable shadowing:

```ruby
a = 4
b = 2

2.times do |a| # to remove variable shadowing, remove parameter 'a'
  a = 5
  puts a
end

puts a
puts b
```

This code outputs `5`, `5`, `4` and `2` in this order.

On `line 1`, local variable `a` is initialized to the Integer `4`. On `line 2`, local variable `b` is initialized to the Integer `2`. On `line 4-7`, method `times` is called on Integer `2` and the `do..end` block with one parameter `a` is passed to the method as an argument. On `line 5`, local variable `a`, passed in as a parameter of the `do..end` block, is assigned the Integer `5`. `puts` method is invoked on `line 6` and takes the same local variable `a` as the argument. This code outputs `5` and `5`. On `line 9`,  `puts` method is called and takes the local variable `a` from the outer scope as the argument. `Line 9` outputs `4`. Similarly, `line 10` outputs `2`, because `b` is initialized to the Integer `2` on `line 2`.