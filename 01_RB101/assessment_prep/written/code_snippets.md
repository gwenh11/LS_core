Suggested response format (based on feedback from other students & Srdjan’s blog post):**What does the code output? What are the return values?****Answer the why behind the output/return:** Focus only on the lines of code that deliver the output and return values. **Summarize what the problem demonstrates and why:** This problem demonstrates the concept of local variable scope/etc…This can be at the beginning or end of your answer - personal preference. 
**Using Markdown: use `backticks` (Markdown formatting) to highlight variable names, methods, and lines you are referring to:** On `line 1` we initialize the local variable…
**Always aim to answer: What does the following code output and return? Why? What concept does it demonstrate?**`Additional Practice Problems:[Collection Methods from Lesson 4](https://launchschool.com/lessons/85376b6d/assignments/fd13de08)[Ruby Basics: Variable Scope](https://launchschool.com/exercise_sets/ece1c62b)[Ruby Basics: Return](https://launchschool.com/exercise_sets/d6b1fb73)Local 

## Variable Scope

### Example 1:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = “Hello”
b = a
a = “Goodbye”
puts a
puts b
```

`Line 4` returns  `nil` and outputs `"Goodbye"`.

`Line 5` returns `nil` and outputs `"Hello"`.

On `line 1`, local variable `a` is initialized to String `'Hello'`. 

On `line 2`, local variable `b` is initialized to the String object that the local variable `a` is referencing. Currently, both local variables `a` and `b` are pointing to the same object. 

On `line 3`, local variable `a` is reassigned to the String `'Goodbye'`. The local variable `a` is now pointing to the String `'Goodbye'`, but local variable `b` is still pointing to the String `'Hello'`.

This problem demonstrates the concept of variables as pointers. Local variable `a` is initialized to one object and later reassigned to a different object.

 

### Example 2:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 4

loop do
 a = 5
 b = 3

 break
end

puts a
puts b
```

This code raises the error `undefined local variable or method b for main:Object`. 

This problem demonstrates variable scoping. On `line 4-8`, method `loop` is invoked and takes the `do..end` block as an argument. The `do..end` block creates an inner scope. Local variable `b` is initialized on `line 5` within this scope. Therefore, local variable `b` is not accessible in the outer scope, when it is passed to method `puts` as an argument on `line 11`.



### Example 3:

What does the following code return? What does it output? Why? What concept does it demonstrate?

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

Both `line 10` and `line 11` returns `nil`. `Line 10` outputs `3`. `Line 11` outputs `2`.

Local variable `a` is initialized to the Integer `4` on `line 1`. On `line 4-8`, method `loop` is invoked with a `do..end` block and creates an inner scope. Within this scope, local variable `c` is initialized to the Integer `3` on `line 5`. Local variable `a` that was declared outside of the scope is accessible in the inner scope. It is reassigned to the same object that local variable `c` references on `line 6`. 

Local variable `b` is initialized to the Integer `2` on `line 2` and passed to `puts` invocation as an argument on `line 11`. 

This problem demonstrates variable scoping. 



### Example 4: blah

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
end

example('hello')
```

`Line 10` returns `nil` and outputs `'hello'` three times.

On `line 10`, method `example` is invoked and the String `'hello'` is passed to it as an argument. `Line 1-8` defines method `example`. Parameter `str` now points to the String `'hello'`. The `loop` method invocation with the `do..end` block on `line 3-7` executes `line 4` three times. 

 This problem demonstrates variable scoping. Method definition`example` has access to the String `'hello'` when `'hello'` is passed to the method as an argument, even though the object is declared outside of the method definition.

 

### Example 5:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def greetings(str)
  puts str
  puts "Goodbye"
end

word = "Hello"

greetings(word)
```

[Problem link](https://launchschool.com/lessons/a0f3cd44/assignments/9e9e907c)

Output: `'Hello'` and `'Goodbye'` respectively

Return value: `nil` because last expression of method definition `greeting` is `puts` invocation

On `line 8`, method `greeting` is invoked with local variable `word` passed to it as an argument. Both local variable `word` and parameter `str` are now pointing to the same object, which is `'Hello'`.

This problem demonstrate variable scoping. Method `greeting` is able to access the object that local variable `word` references, when `word` is passed to the method as an argument.



### Example 6: blah

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4]

counter = 0
sum = 0

loop do
  sum += arr[counter]
  counter += 1
  break if counter == arr.size
end 

puts "Your total is #{sum}"
```

Output: Your total sum is 10

Return value: `nil` because of `puts` method invocation on `line 12`.

On `line 6-10`, method `loop` is invoked with the `do..end` block **(is invoked with the do..end block passed in as an argument)**. Local variable `arr`, `counter` and `sum` that are defined in the outer scope are accessible inside the scope of the `loop` method **(not loop method, fix "inside the scope of the block")**. For each execution **of the block**, local variable `counter` is incremented by 1 (`line 8`). `Line 9` shows the condition when the loop exits (keyword `break`) - the value of local variable `counter` is equal to the size of the array that `arr` references. In addition, during each iteration, element reference method invocation on the array object that `arr` points to at the index whose value is the value of local variable `counter` returns an Integer. This integer is added to the value of `sum` , which returns a new Integer. Local variable `sum` is reassigned to the new Integer. On `line 12`, local variable `sum` references the value of `sum` after the final reassignment and before the loop breaks (with keyword `break`).

This problem demonstrates variable scoping.

- In `line 1` we initialize the local variable `arr` and assign it to the array object `[1, 2, 3, 4]
- In `line 3` we initialize the local variable `counter` and assign it to the integer 0
- In `line 4` we initialize the local variable `sum` and set it to the integer 0
- In `lines 6-10` we call the loop method and pass in a `do..end` block as an argument
- In `line 7` we do two things simultaneously:
  - We call the `array#[]’ method on arr to access a single element. We pass the variable `counter` as an argument within     the brackets and access the element at the index equal to the value of `counter`. In other words, in the first iteration,   since `counter` points to `0`, we call arr[0], which returns the element of the array at index 0, in this case `1`, the     first element of arr.
  - We assign the local variable `sum` to `sum + arr[counter]. In the first iteration, `sum` points to 0 and arr[0] points     to 1, so `sum` is reassigned the value “0 + 1”, which is 1.
- In `line 8`, the counter is incremented by 1. Another way to say this is that we’re reassigning counter to point at “counter + 1”, and in the first iteration, this is “0 + 1” Counter now points at integer 1.
- In `line 9` we add the keyword `break` with an `if` modifier that will exit the loop when the value of counter is equivalent to the size of arr. In each iteration of the loop, the `if` modifier calls the method `Array#size` on `arr` to compare it with the value of `counter`.
- The loop iterates 4 times. On each iteration, the variable ‘sum’ is incremented by the value of the referenced integer in arr. At the time of the break, `counter = 4` and `sum = 10`.
- In `line 12` we call the puts method to output the string “Your total is #{sum}”. Using string interpolation, when the string is output, the value of `sum` replaces #{sum}.
-The return value of the loop is `nil` since `break` returns `nil` unless given a specific value to return. The return value of the last line of code is also `nil` because puts returns `nil`.

### Example 7: blah

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 'Bob'

5.times do |x|
 a = 'Bill'
end

p a
```

Output: "Bill"

Return value: Bill

Local variable `a` is initialized to the String 'Bob' on `line 4` and reassigned 5 times inside method `time` invocation on Integer `5` with a block. 

This problem demonstrates variable scoping. Local variable `a` that is initialized in the outer scope is accessible within the inner scope created inside method `times` invocation with a block.



### Example 8: blah

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
animal = "dog"

loop do |_|
  animal = "cat"
  var = "ball"
  break
end

puts animal
puts var
```

Error `undeclared local variable or method var` is raised. It is because local variable `var` is initialized inside the `loop` method invocation, thus cannot be accessed in the outer scope outside of the `loop` method invocation.



## Variable Shadowing

### Example 1: blah

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end

puts a
puts b
```

On `line 1`, local variable `a` is initialized to the Integer `4`.

On `line 2`, local variable `b` is initialized to the Integer `2`.

On `line 4-7`, we invoke method `Integer#times` on the Integer `2` and pass the `do..end` block to it as an argument. The block takes one parameter `a`.  The block is iterated twice, passing in values from 0 to 1 in turn and assigning it to the block parameter `a`. The method returns the calling object Integer `2`.

On `line 5`, block parameter `a` is reassigned to the Integer `5`.

On `line 6`, we invoke method `Kernel#puts` on the object that block parameter `a` references. This is line outputs `5` and `5`.

On `line 9`, we invoke method `Kernel#puts` on the object that local variable `a` references. This line outputs `4` and returns `nil`.

On `line 10`, we invoke method `Kernel#puts` on the object that local variable `b` references. This line outputs `2` and returns `nil`.

This demonstrates variable shadowing whereby when a local variable in the outer scope and a block parameter in inner scope share the same name, the code executed within the block will use the block parameter and ignore the outer scope local variable; the outer scope variable is 'shadowed' by the block parameter.  This prevents access to the outer scope local variable and no changes can be made to it inside the block.



### Example 2: 

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
n = 10

1.times do |n|
  n = 11
end

puts n
```

Output: `10`

Return value: `nil`





### Example 3:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
animal = "dog"

loop do |animal|
  animal = "cat"
  break
end

puts animal
```





## Object Passing/Variables As Pointers

### Example 1:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = "hi there"
b = a
a = "not here"
```

What are a and b?





### Example 2:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = "hi there"
b = a
a << ", Bob"
```

What are a and b?

On `line 1`, local variable `a` is initialized to the String `'hi there'`.

On `line 2`, local variable `b` is 



### Example 3:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = [1, 2, 3, 3]
b = a
c = a.uniq
```

What are a, b, and c? What if the last line was `c = a.uniq!`?



### Example 4:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def test(b)
  b.map {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
test(a)
```

What is `a`? What if we called `map!` instead of `map`?



### Example 5:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = 5.2
b = 7.3

a = b

b += 1.1
```

What is `a` and `b`? Why? 



### Example 6:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def test(str)
  str += '!'
  str.downcase!
end

test_str = 'Written Assessment'
test(test_str)

puts test_str
```

[Link](https://launchschool.com/blog/object-passing-in-ruby) to explanation of examples below



### Example 7:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def plus(x, y)
  x = x + y
end

a = 3
b = plus(a, 2)

puts a
puts b
```





### Example 8:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def increment(x)
 x << 'b'
end

y = 'a'
increment(y) 

puts y
```

On `line 1-3`, we define method `increment` that takes one parameter `x`.

On `line 2`, we invoke method `String#<<` on the object that parameter `x` references and pass the String `b` to it as an argument.

On `line 5`, we initialize local variable `y` to the String `a`.

On `line 6`, we invoke method `incremenet` and pass the local variable `y` to it as an argument.

On `line 8`, we invoke method `Kernel#puts` and pass local variable `y` to it as an argument.

### Example 9:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def change_name(name)
  name = 'bob'   # does this reassignment change the object outside the method?
end

name = 'jim'
change_name(name)
puts name
```



### Example 10:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def cap(str)
  str.capitalize!  # does this affect the object outside the method?
end

name = "jim"
cap(name)
puts name
```



### Example 11:

What is `arr`? Why? What concept does it demonstrate?

```ruby
a = [1, 3]
b = [2]
arr = [a, b]
arr

a[1] = 5
arr
```





### Example 12 [Link to example](https://launchschool.com/lessons/c53f2250/assignments/1a6a2665)

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

puts arr1 
puts arr2
```



## Object Mutability/Mutating Methods

[Here’s the article](https://launchschool.com/blog/mutating-and-non-mutating-methods) with some of the below examples

### Example 1:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def fix(value)
  value.upcase!
  value.concat('!')
  value
end
s = 'hello'
t = fix(s)
```

What values do `s` and `t` have? Why?

- On `line 6`, local variable `s` is initialized to the String `'hello'`.
- On `line 7`, we invoke method `fix` and pass local variable `s` to it as an argument. Method `fix` parameter `value` is now pointing to the same object as local variable `s` (`'hello'`). We assign local variable `t` the return value of the method invocation. 
- On `lines 1-4`, we define method `fix` that takes one parameter `value`. 
- On `line 2`, we invoke method `String#upcase!` on the object that local variable `value` references. Because `upcase!` is a mutating method, the value of `value` has been mutated. The value of `value` is `'HELLO'`. The value of `s` is `'HELLO'`.
- On `line 3`, we invoke a method `String#concat` on the object that local variable `value` references, and pass the String '!' to it as an argument. The method concatenate the String '!' to the string `value` references. Because `concat` is a mutating method, the value of `value` has been mutated again. The value of `value` is now `'HELLO!'`. The value of `s` is `'HELLO!'`.
- On `line 4`, the value of `value` is used as the implicit return value for the `fix` method definition. The value of `value` is now `'HELLO!'`. 
- Both `s` and `t` point to the String `'HELLO!'`.
- This demonstrates that variables are pointers to physical spaces in memory. Mutating operations changes the address space in memory and this would be reflected in all of the variables that point to this address space. If the operation is non-mutating, this will cause the variable to point to a new address space. 

- This demonstrates object passing. Creating a method definition with a parameter and invoking the method with an argument makes that object passed in as an argument available within the method. 



### Example 2:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def fix(value)
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

What values do `s` and `t` have? Why?

- On `line 6`, local variable `s` is initialized to the String `'hello'`.
- On `line 7`, we invoke method `fix` and pass local variable `s` to it as an argument. Method `fix` parameter `value` is now pointing to the same object as local variable `s` (`'hello'`). We assign local variable `t` the return value of the method invocation. 
- On `lines 1-3`, we define method `fix` that takes one parameter `value`. 
- On `line 2`, we invoke method `String#upcase` on the object that local variable `value` references, and reassign `value` to reference a new, upcased string.
- On `line 3`, we invoke a method `String#concat` on the object that local variable `value` references, and pass the String '!' to it as an argument. The method concatenate the String '!' to the string `value` references. Because `concat` is a mutating method, `value` still references the same string object; it just has been mutated.
- The value of `s` is '`hello'` and of `t` is `'HELLO!'`.
- This demonstrates that variables are pointers to physical spaces in memory. Mutating operations changes the address space in memory and this would be reflected in all of the variables that point to this address space. If the operation is non-mutating, this will cause the variable to point to a new address space. 

- This demonstrates object passing. Creating a method definition with a parameter and invoking the method with an argument makes that object passed in as an argument available within the method. 



### Example 3:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def fix(value)
  value << 'xyz'
  value = value.upcase
  value.concat('!')
end
s = 'hello'
t = fix(s)
```

What values do `s` and `t` have? Why?

- On `line 6`, local variable `s` is initialized to the String `'hello'`.
- On `line 7`, we invoke method `fix` and pass local variable `s` to it as an argument. Method `fix` parameter `value` is now pointing to the same object as local variable `s` (`'hello'`). We assign local variable `t` the return value of the method invocation. 
- On `line 3-4`, we define method `fix` that takes one parameter `value`. 
- On `line 2`, we call method `String#<<` and pass the String `'xyz'` to it as an argument. The method concatenates the String `'xyz'` to the String that local variable `value` references. Since `<<` is a mutating method, the object that `value` points to has been changed. So far, the value of `value` is `'helloxyz'`. The value of `s` is `'helloxyz'`.
- On `line 3`, we call the `String#upcase` on the value of `value` and reassign variable `value` to the return value of the `upcase` method call. The method capitalizes all the characters in the String of the caller. Variable `value` now points to a different object after reassignment. The value of `value` is now `'HELLOXYZ'`. The value of `s` has the same value as before.
- On `line 4`, we call the `String#concat` method on the String that variable `value` references and pass the String `'!'` to it as an argument. The method concatenates the String `'!'` to the value of `value`. Because `concat` is a mutating method, `value` still references the same string object; it just has been mutated one more time. This is the only expression in the method definition, so it determines the method's return value, which is the value of `value`. The value of `value` now is `'HELLOXYZ!'`.
- `s` points to `'helloxyz'` and `t` points to `'HELLOXYZ!'`

- This demonstrates that variables are pointers to physical spaces in memory. Mutating operations changes the address space in memory and this would be reflected in all of the variables that point to this address space. If the operation is non-mutating, this will cause the variable to point to a new address space. 

- This demonstrates object passing. Creating a method definition with a parameter and invoking the method with an argument makes that object passed in as an argument available within the method. 



### Example 4:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def fix(value)
  value = value.upcase!
  value.concat('!')
end

s = 'hello'
t = fix(s)
```

What values do `s` and `t` have? Why?

- On `line 6`, local variable `s` is initialized to the String `'hello'`.
- On `line 7`, we invoke method `fix` and pass local variable `s` to it as an argument. Method `fix` parameter `value` is now pointing to the same object as local variable `s` (`'hello'`). We assign local variable `t` the return value of the method invocation. 

- On `line 3-6`, we define method `fix` that takes one parameter `value`. 
- On `line 4`, we invoke method `String#upcase!` on the object that local variable `value` references. We  reassign `value` to the return value of the `upcase!` method call. Because `upcase!` is a mutating method, `value` still points to the same string object after reassignment; it just has been mutated.
- On `line 5`, we invoke a method `String#concat` on the object that local variable `value` references and pass the String '!' to it as an argument. The method concatenate the String '!' to the string `value` references. Because `concat` is a mutating method, `value` still references the same string object; it just has been mutated one more time. This is the only expression in the method definition, so it determines the method's return value, which is the value of `value`.
- Both `t` and `s` points to `'HELLO!'`.
- This demonstrates that variables are pointers to physical spaces in memory. Mutating operations changes the address space in memory and this would be reflected in all of the variables that point to this address space. If the operation is non-mutating, this will cause the variable to point to a new address space. 

- This demonstrates object passing. Creating a method definition with a parameter and invoking the method with an argument makes that object passed in as an argument available within the method. 



### Example 5:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def fix(value)
  value[1] = 'x'
  value 
end

s = 'abc'
t = fix(s)
```

What values do `s` and `t` have? Why?

- On `line 6`, local variable `s` is initialized to the String `'abc'`.

- On `line 7`, we call method `fix`, pass local variable `s` to it as an argument, and assign the local variable `t` the return value. 

- On `line 1-4`, we define method `fix` that takes one parameter `value`.

- On `line 2`, we call the `Array#[]=` method on the Array object that local variable `value` references to assign an Array element to the String `x`. We pass the Integer `1` within the brackets as an argument, which means the element being assigned is at index `1`. In other words, we assign the element at index `1` of `value`  to the String `'x'`.

- On `line 3`, the value of `value` is used as the implicit return value for the `fix` method definition.

- Both `s` and `t` point to `'axc'`.
- This demonstrates that variables are pointers to physical spaces in memory. Mutating operations changes the address space in memory and this would be reflected in all of the variables that point to this address space. If the operation is non-mutating, this will cause the variable to point to a new address space.

- This demonstrates object passing. Creating a method definition with a parameter and invoking the method with an argument makes that object passed in as an argument available within the method. 



### Example 6:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def a_method(string)
 string << ' world'
end

a = 'hello'
a_method(a)
p a
```

- On `line 5`, local variable `a` is initialized to the String `'hello'`.

- On `line 6`, we call method `a_method` and pass the local variable `a` to it as an argument. Method parameter `string` now points to the same object as local variable `a`.

- On `line 7`, we call method `Kernel#p` and pass `a` to it as an argument. This line outputs and returns `'hello world'`.

- On `line 1-3`, we define method `a_method` that takes one parameter `string`. 

- On `line 2`, we call method `String#<<` and pass the String `' world'` to it as an argument. The method concatenates the String `' world'` to the String that local variable `string` references. Since `<<` is a mutating method, the object that `string` points to has been changed. This is the only expression in the method definition, so it determines the method's return value, which is the value of `string`.
- This demonstrates that variables are pointers to physical spaces in memory. Mutating operations changes the address space in memory and this would be reflected in all of the variables that point to this address space. If the operation is non-mutating, this will cause the variable to point to a new address space. 

- This demonstrates object passing. Creating a method definition with a parameter and invoking the method with an argument makes that object passed in as an argument available within the method. 



### Example 7:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
num = 3
num = 2 * num
```

- On `line `, local variable `num` is initialized to the Integer `3`.

- On `line 2`, we call method `Integer#*` and pass local variable `num` to it. This method performs the multiplication between the Integer `2` and the Integer that `num` points to. We reassign `num` the return value of the multiplication. `num` now points to a different Integer (`6`) comparing to before reassignment. 



### Example 8:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = %w(a b c)
a[1] = '-'
p a
```

- On `line 1`, local variable `a` is initialized to the Array `['a', 'b', 'c']`

- On `line 2`, we call the `Array#[]=` method on the Array object that local variable `a` references to assign an Array element to the String `'-'`. We pass the Integer `1` within the brackets as an argument, which means the element being assigned is at index `1`. In other words, we assign the element at index `1` of  `a` to the String `'-'`.

- On `line 3`, we call method `Kernel#p` and pass `a` to it as an argument. This line outputs and returns `['a', '-', 'c']`.



### Example 9 - [Link to page with #9 & #10](https://launchschool.com/lessons/a0f3cd44/assignments/4b1ad598):

```ruby
def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```

- On `line 5`, local variable `names` is initialized to the Array `['bob', 'kim']`

- On `line 6`, we invoke method `add_name`, and pass the local variable `names` and the String `'kim'` to it as arguments. Method parameter `arr` and `names` now both point to the same Array object (`['bob', 'kim']`). Method parameter `name` now points the string `'jim'`.

- On `line 7`, we call method `Kernel#puts` and pass the variable `names` to it as an argument. This line return `nil`, and outputs `bob` and `kim` respectively.

- On `line 1-3`, we define method `add_name` that take two parameters `arr` and `name`. 

- On `line 2`, we create an Array that has a element `name`. When method `add_name` is called, `[name]` becomes `['jim']`. We call method `Array#+` on the array object that variable `arr` references and pass the Array `[name]` to it as an argument. This method adds elements from `arr` to `name` and returns a new Array. We reassign `arr` to the new Array. Variable `arr` now points to a different object comparing to before reassignment. This is why on `line 7` `names` references the same array that it was initialized to `line 5`. This is the only expression in the method definition, so it determines the method's return value, which is the value of `arr`.

- This demonstrates that variables are pointers to physical spaces in memory. Mutating operations changes the address space in memory and this would be reflected in all of the variables that point to this address space. If the operation is non-mutating, this will cause the variable to point to a new address space. Method `Array#+` and reassignment aren't mutating methods.

- This demonstrates object passing. Creating a method definition with a parameter and invoking the method with an argument makes that object passed in as an argument available within the method. 



### Example 10:

```ruby
def add_name(arr, name)
  arr = arr << name
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```

- On `line 5`, local variable `names` is initialized to the Array `['bob', 'kim']`.

- On `line 6`, we invoke method `add_name`, and pass the local variable `names` and the String `'kim'` to it as arguments. Method parameter `arr` and `names` now both point to the same Array object (`['bob', 'kim']`). Method parameter `name` now points the string `'jim'`.

- On `line 7`, we call method `Kernel#puts` and pass the variable `names` to it as an argument. This line outputs `['bob', 'kim', 'jim']`

- On `line 1-3`, we define method `add_name` that take two parameters `arr` and `name`. Method `add_names` invocation returns the the value of the variable `arr`.

- On `line 2`, we call method `Array#<<` on the object that `arr` references and pass variable `name` to it as an argument. This method concatenates the variable `name` as an element to the Array `arr` references. Since this is a mutating method, it changes the Array object that `arr` points to. We then reassign variable `arr` the return value of the method call. Because method `<<` does not return a new array, `arr` still points to the same object after reassignment. This is the only expression in the method definition, so it determines the method's return value, which is the value of `arr`.

- This demonstrates that variables are pointers to physical spaces in memory. Mutating operations changes the address space in memory and this would be reflected in all of the variables that point to this address space. If the operation is non-mutating, this will cause the variable to point to a new address space.



## Each, Map, Select

### Example 1:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
array = [1, 2, 3, 4, 5]

array.select do |num|
   puts num if num.odd?
end
```

- On `line 1`, local variable `arr` is initialized to the Array  `[1, 2, 3, 4, 5]`.
- On `line 3`, we invoke the `Array#select` method on the Array that local variable `arr` references. `select` returns a new array collection based on the block's return value. If it evaluates to true, then the element is selected. Otherwise, the element is not selected.
- On `lines 3-5`, we pass a block to the `select` method call as an argument. The block is executed for every element in the calling object. For each iteration, an element is passed to the block in turn as an argument and assigned to the block parameter `num`.
- On `line 4`, the right side of the keyword `if` is the conditional for the `if` statement. We call the `Integer#odd?` method on the Integer that local variable `num` references. The method returns the boolean `true` if the value of `num` is an odd integer and `false` otherwise. If the conditional evaluates to `true`, the code `puts num` is executed. Otherwise, nothing is executed, which returns `nil`. As for the code `puts num`, we call the `Kernel#puts` method on the Integer that variable `num` references. It outputs the value of  `num` and returns `nil`. The is the only expression in the block, so it determines the block's return value. The block's return value is `nil`, which is a falsey value for all iterations. Therefore, none of the element in the array of `array` is selected.
- The code returns the new empty array and outputs `1`, `3`, and `5` respectively.



### Example 2:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr.select { |n| n.odd? }
```

- On `line 1`, local variable `arr` is initialized to the Array  `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.
- On `line 2`, we invoke the `Array#select` method on the Array that local variable `arr` references. `select` returns a new array collection based on the block's return value. If it evaluates to true, then the element is selected. Otherwise, the element is not selected.
- On `line 2`, we pass a block to the `select` method call as an argument.  It is indicated by the code in between curly braces. The block is executed for every element in the calling object. For each iteration, an element is passed to the block in turn as an argument and assigned to the block parameter `n`.
- On `line 2`, inside the block, we call the `Integer#odd?` method on the Integer that local variable `n` references. The method returns the boolean `true` if the value of `n` is an odd number. Otherwise, the method returns `false`. This is the only expression in the block, so it determines the block's return value. The block evaluates to `true` when the value of `n` is `1`, `3`, `5`, `7`, and `9` respectively. Therefore, these values from the calling array are selected. The new array has a different size than the calling array.
- The code returns the new array `[1, 3, 5, 7, 9]`. The block evaluates to `true` when the value of `n` is `1`, `3`, `5`, `7`, and `9` respectively. Therefore, these values from the calling array are selected. The new array has a different size than the calling array.



### Example 3:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n| 
  n + 1
end
p new_array
```

- On `line 1`, local variable `arr` is initialized to the Array  `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.
- On `line 3`, local variable `new_array` is assigned to the return value of the `Array#select` method call on the Array that local variable `arr` references. `select` returns a new array collection based on the block's return value. If it evaluates to true, then the element is selected. Otherwise, the element is not selected.
- On `lines 3-5`, we pass the `do..end` block as an argument the `select` method call. The block is executed for every element in the calling object. For each iteration, an element is passed to the block in turn as an argument and assigned to the block parameter `n`
- On `line 4`, we call method `Integer#+` on the Integer that local variable `n` references and pass the Integer `1` to it as an argument. The method adds the value of `n` to the Integer `1` and returns a new Integer. This is the only expression in the block, so it determines the block's return value. The block's return value is an Integer, which is a truthy value for all iterations. Therefore, all elements the array of `arr` is selected.
- On `line 6`, we invoke method `Kernel#p` on the object that variable `new_array` references. This line outputs and returns the new array `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`. 



### Example 4:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n| 
  n + 1
  puts n
end
p new_array
```

- On `line 1`, local variable `arr` is initialized to the Array  `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.
- On `line 3`, local variable `new_array` is assigned to the return value of the `Array#select` method call on the Array that local variable `arr` references. `select` returns a new array collection based on the block's return value. If it evaluates to true, then the element is selected. Otherwise, the element is not selected.
- On `lines 3-5`, we pass the `do..end` block as an argument the `select` method call. The block is executed for every element in the calling object. For each iteration, an element is passed to the block in turn as an argument and assigned to the block parameter `n`
- On `line 4`, we call method `Integer#+` on the Integer that local variable `n` references and pass the Integer `1` to it as an argument. The method adds the value of `n` to the Integer `1` and returns a new Integer.
- On `line 5`, we invoke method `Kernel#puts` and pass local variable `n` to it as an argument. This line outputs the value that `n` references and returns `nil`  in every iteration. This is the last expression of the block, so it determines the return value of the block. 
- The block's return value is `nil` for all iterations, so none of the element the array of `arr` is selected.
- On `line 7`, we invoke method `Kernel#p` on the object that variable `new_array` references. This line outputs and returns the empty array `[]`. 



### Example 5:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
words = %w(jump trip laugh run talk)

new_array = words.map do |word|
  word.start_with?("t")
end

p new_array
```

- On `line 1`, local variable `words` is initialized to the Array `["jump", "trip", "laugh", "run", "talk"]`.
- On `line 3`, local variable `new_array` is assigned to the return value of the `Array#map` method call on the Array that local variable `words` references. `map` returns a new array collection based on the block's return value. Each element is transformed based on the block's return value.
- On `lines 3-5`, we pass the `do..end` block as an argument the `map` method call. The block is executed for every element in the calling object. For each iteration, an element is passed to the block in turn as an argument and assigned to the block parameter `word`.
- On `line 4`, we call method `String#start_with?` on the String that local variable `word` references and pass the String `"t"` to it as an argument. It returns the boolean `true` if the caller starts with `"t"`. It returns `false` otherwise. This is the only expression in the block, so it determines the block's return value.
- On `line 7`, we call `Kernel#p` method on the array that variable `new_array` references. It outputs and returns the new array `[false, true, false, false, true]`.



### Example 6:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.each { |n| puts n }
```

- On `line 1`, local variable `arr` is initialized to the Array  `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.
- On `line 3`, we call method `Array#each` on the array that local variable `arr` references. `each` returns the calling object.
- On `line 3`, we pass a block to the `each` method call as an argument.  It is indicated by the code in between curly braces. The block is executed for every element in the calling object. For each iteration, an element is passed to the block in turn as an argument and assigned to the block parameter `n`.
- On `line 3`, inside the block, we call method `Kernel#puts` on the object that local variable `n` references. This line outputs the value of `n` and returns `nil` for each iteration. The outputs are `1`, `2`, `3`, `4`, `5`, `6`, `7`, `8`, `9`, and `10` respectively. 



### Example 7:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

incremented = arr.map do |n| 
  n + 1
end
p incremented
```

- On `line 1`, local variable `arr` is initialized to the Array  `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.

- On `line 3`, local variable `incremented` is assigned the return value of the method call `Array#map` on the Array object that local variable `arr` references. `map` returns a new array collection based on the block's return value. Each element is transformed based on the block's return value.

- On `lines 3-5`, we pass in the `do..end` block as an argument to the method `map` call. The block is executed for every element in the calling object. For each iteration, an element is passed to the block in turn as an argument and assigned to the block parameter `n`.
- On `line 4`, we call method `Integer#+` on the Integer that local variable `n` references and pass the Integer `1` to it as an argument. The method adds the value of `n` to the Integer `1` and returns a new Integer. This is the only expression in the block, so it determines the block's return value.
- On `line 6`, we invoke method `Kernel#p` on the Array that variable `incremented` references. This line outputs and returns `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]`.



### Example 8:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n| 
 n > 1
end
p new_array
```

- On `line 1`, local variable `arr` is initialized to the Array  `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.
- On `line 3`, local variable `new_arry` is assigned the return value of the method call `Array#map` on the Array object that local variable `arr` references. `map` returns a new array collection based on the block's return value. Each element is transformed based on the block's return value.
- On `lines 3-6`, we pass in the `do..end` block as an argument to the method `map` call. The block is executed for every element in the calling object. For each iteration, an element is passed to the block in turn as an argument and assigned to the block parameter `n`.
- On `line 4`, we call the `Integer#>` method on the Integer that local variable `n` references and pass the Integer `1` to it as an argument. The `>` method compares the value of the calling object with the argument. If the value of variable `n` is greater than the Integer `1`, the expression returns the boolean `true`. Otherwise, the expression returns `false`.

- The code returns `[false, true, true, true, true, true, true, true, true, true]`



### Example 9:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.map do |n| 
  n > 1
  puts n
end
p new_array
```

- On `line 1`, local variable `arr` is initialized to the Array `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]`.
- On `line 3`, local variable `new_arry` is assigned the return value of the method call `Array#map` on the Array object that local variable `arr` references. `map` returns a new array collection based on the block's return value. Each element is transformed based on the block's return value.
- On `lines 3-6`, we pass in the `do..end` block as an argument to the method `map` call. The block is executed for every element in the calling object. Each element is passed to the block in turn as an argument and assigned to the block parameter `n`.
- On `line 4`, we call the `Integer#>` method on the Integer that local variable `n` references and pass the Integer `1` to it as an argument. The `>` method compares the value of the calling object with the argument. If the value of variable `n` is greater than the Integer `1`, the expression returns the boolean `true`. Otherwise, the expression returns `false`.
- On `line 5`, we invoke method `Kernel#puts` and pass local variable `n` to it as an argument. This line outputs the value that `n` references and returns `nil`  in every iteration. This is the last expression of the block, which also determines the return value of the block. Therefore, the block's return value is `nil` for all iterations.
- On `line 7`, we invoke method `Kernel#p` on the object that variable `new_array` references. This line outputs and returns `[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]`.



### Example 10:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = "hello"

[1, 2, 3].map { |num| a }
```

- On `line 1`, local variable `a` is initialized to the String `"hello"`.
- On `line 3`, we call method `Array#map` on the Array object `[1, 2, 3]`. `map` returns a new array collection based on the block's return value. Each element is transformed based on the block's return value. 
- On `line 3`, we pass in a block as an argument to the method `map` call. It is indicated by the code in between curly braces. The block is executed for every element in the calling object. For each iteration, an element is passed to the block in turn as an argument and assigned to the block parameter `num`. The return value of the block is determined by what local variable `a` points to. Variable `a` points to the String `"hello"` per `line 1`. Therefore, the block's return value is `"hello"` for all iterations.
- The code returns `["hello", "hello", "hello"]`.



### Example 11:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
[1, 2, 3].each do |num|
  puts num
end
```

- On `line 1`, we call method `Array#each` on the Array `[1, 2, 3]`. `each` returns the calling object, but it is not used in this case.
- On `lines 1-3`, we pass the `do..end` block to method `each` call as an argument. The block is executed for every element in the calling object. For each iteration, an element is passed in turn as an argument and assigned to the block parameter `num`.
- On `line 2`, we call method `Kernel#puts` and pass variable `num` to it as an argument. This line outputs the value that `num` references and returns `nil` in every iteration. The outputs are `1`, `2` and `3` respectively.



## Other Collection Methods

[Link to all examples below](https://launchschool.com/lessons/85376b6d/assignments/d86be6b5)

### Example 1:

```ruby
[1, 2, 3].any? do |num|
 num > 2
end
```

- On `line 1`, we call method `Array#any?` on the Array `[1, 2, 3]`. This method returns a boolean value based on the block's return value. 
- On `lines 1-3`, we pass the `do...end` block to the method call as an argument. The block is executed for every element in the Array. For each iteration, an element is passed to the block in turn as an argument and assigned to the block parameter `num`.
- On `line 2`, we call the `Integer#>` method on the Integer that local variable `num` references and pass the Integer `2` to it as an argument. The `>` method compares the value of the calling object with the argument. If the value of variable `num` is greater than the Integer `2`, the expression returns the boolean `true`. Otherwise, the expression returns `false`.
- This is the only and last line expression in the block, so it determines the return value of the block. 
- If the block evaluates to `true` for at least one iteration, method `any?` returns `true`. 
- If the block evaluates to `false` or `nil` for all iterations, method `any?` returns `false`.
- The block evaluates to `true` when `num` points to `3`, so the code return `true`.



### Example 2:

```ruby
{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.size > 4
end
```

- On `line 1`, we call method `Enumerable#any?` on the Hash `{ a: "ant", b: "bear", c: "cat" }`. This method returns a boolean value based on the block's return value. 
- On `lines 1-3`, we pass the `do...end` block to the method call as an argument. The block is executed for every key-value pair in the Hash. For each iteration, a key-value pair is passed to the block in turn as an argument. The key is assigned the block parameter `key` . The value is assigned to the block parameter `value`.
- On `line 2`, we call method `String#size` on the String object that local variable `value` references. It returns an Integer that indicates the length of the String. We then call the `Integer#>` method on this Integer and pass the Integer `4` to it as an argument. The `>` method compares the value of the calling object with the argument. If the Integer is greater than the Integer `4`, the expression returns the boolean `true`. Otherwise, the expression returns `false`.
- This is the only and last line expression in the block, so it determines the return value of the block. 
- If the block evaluates to `true` for at least one iteration, method `any?` returns `true`. 
- If the block evaluates to `false` or `nil` for all iterations, method `any?` returns `false`.
- The block evaluates to `false` for all iterations, so the code return `false`.



### Example 3:

```ruby
[1, 2, 3].all? do |num|
  num > 2
end
```

- On `line 1`, we call method `Array#all?` on the Array `[1, 2, 3]`. This method returns a boolean value based on the block's return value.
- On `lines 1-3`, we pass the `do..end` block to the method call as an argument. The block is executed for every element in the Array. For each iteration, an element is passed to the block in turn as an argument and assigned to the block parameter `num`. 
- On `line 2`, we call the `Integer#>` method on the Integer that local variable `num` references and pass the Integer `2` to it as an argument. The `>` method compares the value of the calling object with the argument. If the value of variable `num` is greater than the Integer `2`, the expression returns the boolean `true`. Otherwise, the expression returns `false`.
- This is the only and last line expression in the block, so it determines the return value of the block. 
- If the block evaluates to `true` for iterations, method `all?` returns `true`. 
- If the block evaluates to `false` or `nil` for at least one iteration, method `all?` returns `false`.
- The block evaluates to `false` when `num` points to `1` and `2`, so the code return `false`.



### Example 4:

```ruby
{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end
```

- On `line 1`, we call method `Enumerable#all?` on the Hash `{ a: "ant", b: "bear", c: "cat" }`. This method returns a boolean value based on the block's return value.
- On `lines 1-3`, we pass the `do..end` block to the method call as an argument. The block is executed for every key-value pair in the Hash. For each iteration, a key-value pair is passed to the block in turn as an argument. The key assigned to the block parameter `key`. The value is assigned to the block parameter `value`. 
- On `line 2`, we can method `String#length` on the String object that local variable `value` references. It returns an Integer indicating the length of the String. We then call the `Integer#>=` method on this Integer and pass the Integer `3` to it as an argument. The `>=` method compares the value of the calling object with the argument. If the value of variable `num` is equal or greater than the Integer `3`, the expression returns the boolean `true`. Otherwise, the expression returns `false`.
- This is the only and last line expression in the block, so it determines the return value of the block. 
- If the block evaluates to `true` for iterations, method `all?` returns `true`. 
- If the block evaluates to `false` or `nil` for at least one iteration, method `all?` returns `false`.
- The block evaluates to `true` for all iterations, so the code returns `true`.



### Example 5:

```ruby
[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}."
end
```

- On `line 1`, we call method `Enumerable#each_with_index` on the array `[1, 2, 3]`. `each_with_index` returns the calling object.
- On `lines 1-3`, we pass the `do..end` block to the method call as an argument. The block is executed for every element in the calling object. For each iteration, the element is passed to the block in turn and assigned to the block parameter `num`. In addition, the element index value is passed the block parameter `index`. 
- On `line 2`, we interpolate the String `"The index of is"` with the values that variable `num` and `index` reference. We then pass this String to the method call `Kernel#puts` as an argument. This line outputs the following:
  - The index of 1 is 0.
  - The index of 2 is 1.
  - The index of 3 is 2.



### Example 6:

```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << pair.last
end
```

- On `line 1`, we call method `Enumerable#each_with_object` on the Hash  `{a: "ant", b: "bear", c: "cat"}` and pass an Array to it as an argument. The Array is initialized to an empty Array, which is shown as a pair of square brackets inside the parentheses. `each_with_object` later returns the Array that is updated based on the block's return value.
- On `lines 1-3`, the `do..end` block is also passed to the method call as an argument. The block is executed for every key-value pair in the calling object. For each iteration, an Array referencing the key-value pair is passed to the block in turn as an argument. The first element references the key. The second element references the value. The Array is assigned to the block parameter `pair`. In addition, the empty Array is passed to the block and assigned to the block parameter `array`. A new array element is added to the Array based on the block's return value after each iteration.
- On `line 2`, we call method `Array#last` on the Array that local variable `pair` references. It returns the last element of the Array. We then call method `Array<<` on the object that variable `array` references and pass this element to it as an argument. The method `<<` mutates the value of `array` and adds the element to it after each iteration. This is the only and last expression in the block, so it will  determine the block's return value.

- This code returns a new Array `["ant", "bear", "cat"]`.



### Example 7:

```ruby
{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end
```

- On `line 1`, we call method `Enumerable#each_with_object` on the Hash `{a: "ant", b: "bear", c: "cat"}` and pass a Hash to it as an argument. The Hash is initialized to an empty Hash, which is shown as a pair of curly braces inside the parentheses. `each_with_object` later returns the Hash that is updated based on the block's return value.
- On `lines 1-3`, the `do..end` block is also passed to the method call as an argument. The block is executed for every key-value pair in the calling object. For each iteration, a key-value pair is passed to the block in turn as an argument. The key is assigned to the block parameter `key`. The  value is assigned the block parameter `value`. In addition, the empty Hash is passed to the block and assigned to the block parameter `hash`. A new key-value pair is added to the Hash based on the block's return value after each iteration.

- On `line 2`, we call method `Hash#[]=` on the object that local variable `hash` references. The method creates a new key-value pair in the calling object. Local variable `value` is passed to the method as an argument, whose value serves as the key. The value that variable `key` references serves as the value. This is the only and last expression in the block, so it will determine the block's return value.

- The code returns a new Hash `{"ant" => :a, "bear" => :b, "cat" => :c}



### Example 8:

```ruby
odd, even = [1, 2, 3].partition do |num|
  num.odd?
end

p odd 
p even
```

- On `line 1`, we call method `Enumerable#partition` on the Array object `[1, 2, 3]`. The return value is explained as follows:
  - The `partition` method returns a new array that has two elements and each element is also an array. The first sub-array contains elements from the original collection if the block evaluates to true and the second sub-array contains everything else. 
  - Local variables `odd` and `even` are parallelly assigned to the elements of the new array. Variable `odd` is assigned to the first sub-array and variable `even` is assigned to the second sub-array.

- On `lines 1-3`, we pass the `do..end` block to the method `partitition` call as an argument. The block is executed for every element in the calling object. For each iteration, an element is passed to the block in turn as an argument and assigned to the block parameter `num`. The  block's return value is used by the method `partitition`.

- On `line 2`, when we call method `Integer#odd?` on the object that local variable `num` references. The method returns true, when variable `num` points to an odd number. The method returns false, when variable `num` points to an even number. The return value of the method `odd?` invocation is used to determine the block's return value.

- On `line 5`, we call method `Kernel#p` on the array object that local variable `odd` references. This line outputs and returns `[1, 3]` for which the block evaluates to true.

- On `line 6`, we call method `Kernel#p` on the array object that local variable `even` references. This line outputs and returns `[2]` for which the block evaluates to false.
- The return value for the `partition` method call is `[[1, 3], [2]]`.



## Truthiness

### Example 1:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
a = "Hello"

if a
  puts "Hello is truthy"
else
  puts "Hello is falsey"
end
```

- On `line 1`, local variable `a` is initialized to the String `"Hello"`.

- On `lines 3-7`, we have an if conditional:
  - If variable `a` evaluates to true, `line 4` is executed. The code outputs `'Hello is truthy'` and returns `nil`.
  - If variable `a` evaluates to false, `line 6` is executed. The code outputs `"Hello is falsey"` and returns nil. 

- Because variable `a` references a truthy value (String `"Hello"`), `line 4` is executed. 



### Example 2:

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
def test
  puts "written assessment"
end
var = test

if var
  puts "written assessment"
else
  puts "interview"
end
```

- On `line 4`, local variable `var` is assigned to the return value of the method `test` invocation .

- On `line 1-3`, we define method `test`.

- On `line 2`, we call method `Kernel#puts` and pass the String `"written assessment"` to it as an argument. This is the only and last expression in the method definition. It returns `nil`, Therefore, variable `var` points to `nil` on `line 4`.
- On `lines 6-10`, we have a if conditional:
  - If local variable `var` evaluates to true, `line 7` is executed, which outputs  `written assessment` and returns `nil`.
  - If local variable `var` evaluates to false, `line 9` is executed, which outputs `interview` and returns `nil`.
- Because local variable `var` points to `nil`, `line 9` is executed. 