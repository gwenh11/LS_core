# General Concepts

#### `do..end`

defines a block in which __

We are calling the method __ and passing the `do...end` block as argument on lines __.

Each element is passed to the block in turn and assigned to the block parameter ___.

They create a new scope for local variables; usually referred to as an inner scope when created by a block following a method invocation.



#### Variable

The local variable `a` is initialized to a string object `hello`.

The local variable `a` is reassigned to __

The variable is passed to a method as argument.

The local variable `greeting` now references the string object `hello`.

The local variable `a` has not been modified, and still references the integer object `5`



#### Variables as pointers

This demonstrates that variables are pointers to physical spaces in memory. Mutating operations changes the address space in memory and this would be reflected in all of the variables that point to this address space. If the operation is non-mutating, this will cause the variable to point to a new address space. 

```ruby
def method_ex(value)
  value = value.upcase!
end

greeting = "guten tag"

p method_ex(greeting)
p greeting

# Since the return value of #upcase! is referencing the same object as the outer scope local variable `greeting`, reassigning `value` to it doesn't cause it to point to a new object. 
# It just rebinds `value` back to the object it was previously bound to.
```



#### Object passing

This demonstrates object passing. Creating a method definition with a parameter and invoking the method with an argument makes that object passed in as an argument available within the method. 



#### Truthiness

The variable `a` is pointing to evaluates to `true`.  The variable `b` is pointing to evaluates to `false`.

The value of `true` evaluates `true`/truthy, the value of `false` evaluates to `false`/falsey.

In Ruby, every value apart from `false` and `nil`, evaluates to `true` in a boolean context.

In Ruby, every value apart from `false` and `nil` is truthy; we can also say that `false` and `nil` are falsey.

The evaluation of every ruby object into a boolean value.



#### `if` conditionals

The return value of the if conditional is based on the last line of code run in the branch executed.

If returns the return value of the last thing executed in one of the if/else if/else clauses. If none of those clauses get executed, the return value is nil



#### Inner scope outer scope - method definition

Inner scope can access variables initialized in an outer scope, but not vice versa.

A method definition can't access local variables in another scope.

A method definition can access objects passed in.

This demonstrates local variable scoping rules whereby a variable initialized in the outer scope (in this case `a`) is available in the inner scope created by a block following method invocation, whereas a variable initialized in the inner scope created by a block following method invocation (in this case `b`) is not available in the outer scope.

Method definition sets a certain scope for any local variables in terms of the parameters that the method definition has, what it does with those parameters and how it interacts with a block (if it does at all)

This demonstrates that method definitions are self-contained when it comes to local variables. Local variables initialized outside the method definition are not available within the method definition, nor are local variables within the method definition available outside of it. If the method definition needs access to a local variable in the outer scope, it must be passed into it as an argument  at method invocation (and the method needs to be defined to take a parameter). Method definitions can mutate the original object if, within the definition, a mutating action is performed on it.



#### Method invocation

Uses the scope set by the method definition. 

Method invocation with a `do...end` or `{..}` passed in, defines a block; the block is part of the method invocation.



#### Variable scope

Outer scope variables can be accessed by inner scope.

Inner scope variables cannot be accessed in outer scope.

Peer scopes do not conflict.

Nested blocks follow the same rules of inner and outer scoped variables. When dealing with nested blocks, our usage of what's "outer" or "inner" is going to be relative. We'll switch vocabulary and say "first level", "second level", etc."
variable shadowing
Constants behave like globals.



#### Collection type

hash, array, range
strings are not collections and so enumerable methods can't be used on them.



#### Enumerator

A way to iterate through a collection type



#### Enumerable

Methods that use Enumerator



#### Syntactical Sugar

`"hello".*(5) = "hellohellohellohellohello"` with syntactic sugar is `"hello" * 5`

`Kernel.puts("Hello")` is `puts "Hello"`

`inject(:&) / reduce(:+)`



#### Variable shadowing

Variable shadowing occurs when a variable declared within the inner scope of a block delimited by `do..end` has the same name as a variable declared in an outer scope, and the block parameter has the same name.

But what if we had a variable named n in the outer scope? We know that the inner scope has access to the outer scope, so we'd essentially have two local variables in the inner scope with the same name.  When that happens, it's called variable shadowing, and it prevents access to the outer scope local variable

The reason variable shadowing happens is because the local scope looks for the variable inside it before looking in the outer scope. If the variable is found in the local scope then the outer scope variable is never touched.

This demonstrates variable shadowing whereby when a local variable in the outer scope and a block parameter in inner scope share the same name, the code executed within the block will use the block parameter and ignore the outer scope local variable; the outer scope variable is 'shadowed' by the block parameter.  This prevents access to the outer scope local variable and no changes can be made to it inside the block.

(Wikipedia definition) occurs when a variable declared within a certain scope (decision block, method, or inner class) has the same name as a variable declared in an outer scope.



#### Object mutability

"This demonstrates that variables are pointers to physical spaces in memory. Mutating operations can change the address space in memory and this would be reflected 
in all of the variables that point to this address space. If the operation is non-mutating, this will cause the variable to point to a new address space"
In this case, ??? is non-mutating and the object initially referenced by ??? is not changed. Instead, ??? is bound to a new object altogether.
In this case, ??? is mutating and the object initially referenced by ??? is changed affecting all variables pointing to it.
"In Ruby, integers and symbols with same values occupy the same physical space in memory and are thus the same object. 
So, in this case, integer with value of ??? will always be the same object regardless of which local variable it is assigned to.
Integers and symbols are immutable objects."

```ruby
a = 5
b = 5

p a.object_id => 10
p b.object_id => 10
```



#### Implicit return

The last line of the method executed is returned.
	

#### Explicit return

The return value is based on the `return` keyword.  Needs "return" explicitly written in the method.
	

#### Pass by value	

The concept demonstrated is how ruby can act as pass by value because of the reassignment on line __ , specifically local variable`__` inside of the method named `__` is not pointing to the same object as `___` in the outer scope.


#### Pass by value with integers as arguments. 

The concept demonstrated is how ruby can act as pass by value because in ruby integers are immutable.
	

#### Indexed assignment (pass by reference)	

On line __ `[]=` index reassignment method is used which is a mutating method so the object ___ is referencing would be modified and that original object is returned on line ___.  The concept demonstrated is how ruby can act as pass by reference. When two or more variables are pointing to the same object, if the object is modified in place, all of the variables point to the same, modified, object.



#### Pass by reference vs pass by value

pass by reference is where the argument passed into the method is mutated.

pass by value is where the argument passed into the method is not mutated.	
Pass by value of reference is just ruby being able to use both pass by value or pass by reference.	
	

#### String Interpolation	

Within the block, we use string interpolation to input each element to the string object. 

Where the last part of the string uses string interpolation to add the local variable `letter` on each call ('a', 'b', 'c').



#### Methods

the `loop` method is invoked with a `do..end` block passed in as an argument. 

The variable `str` is passed to the method as argument
we invoked the method `upcase!` on the object variable `a` is pointing to, which mutates the String object in place to uppercase. A new string object is not created, the original object was mutated. The variable `a` now references the same object whose value is now `HELLO`
method is invoked with argument
Method is defined with parameter
we define the method `my_method` which takes 1 parameter `string`
we invoke the method `my_method` and passing `str` as argument
we invoke the method `my_method` and passing the `do..end` block as argument
we invoke the method `my_method` and passing the `do..end` block as argument with one parameter `param`
we are breaking out of the loop by using the keyword `break`
"This demonstrates that method definitions are self-contained when it comes to local variables. If the method definition needs access to a local variable in the 
outer scope, it must be passed into it as an argument at method invocation (and the method needs to be defined to take a parameter). 
Method definitions can mutate the original object if, within the definition, a mutating action is performed on it."



#### Destructive vs non-destructive methods

the `+=` does not modify the `float` object - which is immutable. the `+=` method only creates a brand new float object whose value is `2.5`, which `a` is reassigned to the setter method and indexed assignment `[ ] =` mutates the object  arr = ["hello", "goodbye", "hey"]. arr[0] = "what's up" (mutates the object in the array, not the whole array).



#### Object literal	

Any object in Ruby. ex. "Hello", 5, true



#### Last evaluated statement within the block

and, since this is the last evaluated statement within the block, the return value of the block is therefore _____

#### Positional argument
`doc/syntax/calling_methods.doc` under `Default Positional Arguments`

Ruby lets you use default arguments in the middle of number of positional arguments. Documentation shows that positional arguments are filled out first, then default arguments are set with any values supplied, and finally, default values are applied to anything remaining. 

```ruby
def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)
#=> [4, 5, 3, 6]
```

First, `4` is assigned to `a`, `6` is assigned to `d`. Only arguments with default values remain. Since `5` has not been assigned, it is given to `b` (Ruby fills in missing arguments from left to right) and `c` uses default value `3`.

In other words, `4`, `5` and `6` are assigned to the **positional arguments** `a`, `b`, and `d`. `5` overrides the default value for `b` and `c` takes the default value.

# Keywords

***keywords never create their own scope	

#### `break` 

returns `nil` unless a value is given	break 5 if true (break would return 5)

#### `if` statement 

returns `nil` if none of the branches execute	

#### `while`		

#### `until`	



# Methods

Method documentation will normally include:

- One or more method signatures (which will indicate whether the method takes arguments and/ or a block and what it returns)
- A brief description of how the method is used, often covering different use cases
- Some code examples, again usually covering various use cases



When studying methods, we should considers:

- Whether the method takes a block
- How it handles the block's return value
- What the method itself returns



#### `[]=`

indexed assignment mutates the collection but reassigns the element



#### `i -= 1`

reassigning the local variable `i` to the return value of a method call `Integer#-` on the Integer that local variable `i` references and the Integer `1` is passed in as an argument.



#### `each`

On `[line #]`, we call the `each` method on the `[collection_type]` collection that `[collection_var]` references and pass in the `do..end` block as an argument. The block is executed for every element in the calling object, but the block's return value is ignored. For each iteration, an element is passed to the block in turn as an argument and assigned to the block parameter  `[block_parameter]`.  `each` returns the calling object.

`each` returns the original object the method was called on. The block's return value does not influence what the method `each` returns.

`each` iterates through and returns the original array the method was called on. The blocks return value does not influence what the method each returns (iteration).



#### `map`
On `[line #]`, we call the `map` method on the `[collection_type]` collection that `[collection_var]` references and pass in the `do..end` block as an argument. The block is executed for every element in the calling object. For each iteration, an element is passed to the block in turn as an argument and assigned to the block parameter  `[block_parameter]`.  `map` returns a new `[collection_type]` collection based on the block's return value. Each element is transformed based on the block's return value. Therefore, the new collection has the same length as the calling object.

The `map` method iterates through the collection, passing each element to the do..end block.  Each inner is passed to the block in turn and assigned to the local variable ___. - `map` returns a new array based on the block's return value. Each element is transformed based on the return value of the block.

`map` returns a new transformed array based on the blocks return value. Each element is transformed based on the return value (block parameter does not have to be used) (transformation).

We invoke the `map` method on the array `[1,2,3]` and pass in the `do..end` block as argument. As the `map` method iterates through the array, it passes the element to the block parameter `n`, then run the block



#### `select`

On `[line #]`, we call the `select` method on the `[collection_type]` collection that `[collection_var]` references and pass in the `do..end` block as an argument. The block is executed for every element in the calling object. For each iteration, an element is passed to the block in turn as an argument and assigned to the block parameter  `[block_parameter]`.  `select` returns a new `[collection_type]` collection based on the block's return value. If it evaluates to true, then the element is selected. Otherwise, the element is not selected. Therefore, the new collection has the same or shorter length than the calling object.

The `select` method iterates through the collection, passing each element to the do..end block.  Each inner  is passed to the block in turn and assigned to the local variable ___. __

If the return value of the block is truthy, it takes the original element and places it into a new ____ this new _____ is the return value of the method. - #select returns a new _____ based on the truthiness of the block's return value. 
\- #select returns a new array based on the block's return value. If the block's return value evaluates to true, then the element is selected (selection).



#### `sort`

Sorting is comparing the items in a collection with each other, and ordering them based on the result of that comparison, using the <=> method (spaceship operator).

Comparison is at the heart of sorting. When sorting collections, you need to know if the objects you want to sort on implement a `<=>` method and how that method is defined.

The `sort` method doesn't actually care about how `<=>` compares items, all it is concerned about is the return value of the `<=>` method (that is, it's looking for `-1`, `0`, `1` or `nil`).

Based on a return value of -1, 0, 1 where -1 means less than, 0 means equal, and 1 means greater than sort will organize the new returned array. If the <=> operator encounters two elements of different data types, `nil` is returned and `ArgumentError` is raised.

The <=> method performs comparison between two objects of the same type and returns a `-1`, `0`, or `1`, depending on whether the first object is less than, equal to, or greater than the second object; if the two objects cannot be compared then nil is returned.

The sort method only sorts collections if they are same data type. If they aren't the same data type an error is raised. If comparing a nested array then each index of the sub_ar's need to have matching data types. Otherwise an error is thrown.

We can also call `sort` with a block; this gives us more control over how the items are sorted. The block needs two arguments passed to it (the two items to be compared) and the return value of the block has to be `-1`, `0`, `1` or `nil`.

This demonstrates how the `sort` method works, it implements the `<=>` method to compare 2 elements at a time to determine how to sort them in a new array based on whether the `a <=> b` expression returns -1, 0, or 1.

Will sort hashes by the key

Returns a new array object even if the caller is a different collection type

- `String#sort`
  - When comparing strings, sort uses the ASCII position or ordinal value, character by character.
  - `String#<=>` compares multi-character strings character by character, so the strings beginning with `'a'` will come before those beginning with `'b'`; if both characters are the same then the next characters in the strings are compared, and so on.
- `Integer#sort`
  - The integers are compared based on their numeric value. 
  - The comparison is carried out using the `Integer#<=>` method which returns `-1`, `0`, `1` depending on whether the first integer is less than, equal to or greater than the second integer.



#### `sort_by`

The key here is understanding that when we carry out transformation within a sort_by block, the transformed elements are what are then used to perform the comparison.

`sort_by` always returns an array, even when called on a hash, so the result here is a new array with the key-value pairs as objects in nested arrays. If we need to convert this back into a hash we can call `Array#to_h` on it.

This code demonstrates how `sort_by` method works, comparing elements by the criteria specified in the block with the <=> operator method.



#### `Array#sort` and `Array#sort_by`

`Array#sort` and `Array#sort_by` have a equivalent destructive methods `Array#sort!` and `Array#sort_by!`. With these methods, rather then returning a new collection, the same collection is returned but sorted. These methods are specific to arrays and are not available to hashes.



#### `Integer#times`

We are calling the `times` method on the `integer` object `3`; the given block iterates 3 times passing in values from zero to 3 - 1 to the block parameter



#### `Kernel#puts`

The `puts` method then outputs a string representation of the passed in argument and returns `nil`.



#### `Kernel#p`

`p` returns the object you pass to it. `p` is a method that shows a more “raw” version of an object.

For each object, directly writes `obj.inspect` followed by a newline to the program's standard output.

`inspect` is an alias to `to_s`. Creates a string representation of self, by calling inspect on each element.



#### `Enumerable#any?`

`any?` looks at the *truthiness* of the **block's** return value in order to determine what the **method's** return value will be. If the block returns a "truthy" value for any element in the collection, then the method will return `true`.

`any?` will return true if the block passed to it returns AT LEAST one element that evaluates to true in the `[collection]`.



#### `Enumerable#all?`

`all?` will return `true` if the block passed to it never returns a value of `false` or `nil` for every element in the `[collection]`.

`all?` will return true if the block passed to it never returns a value of false or nil for every key/value pair in the hash



#### `Enumerable#each_with_index`

 `each_with_index` take a block and execute the code within the block, the block's return value is ignored. `each_with_index` takes a second argument which represents the index of each element.

When calling `each_with_index` on a hash, the first argument now represents an array containing both the key and the value.



#### `Enumerable#each_with_object`

This demonstrates that `each_with_object` passes the given object into the block and its updated value is returned at the end of each iteration. Once the method has finished iterating over the original collection, it returns the object that was passed in as an argument containing all of the updates.

When calling `each_with_object` on a hash, the first argument now represents an array containing both the key and the value.



#### `Enumerable#first`

`first` does not take a block. When given an argument, `first` will return the specified number of elements. 

`first` can be called on a hash in Ruby. The return value is a nested array. Each sub-array is a key-value pair (first element is key, second element is value).



#### `Enumerable#include?`

`include?` does not take a block, but requires one argument. It returns `true` if the argument exists in the collection and `false` if it doesn't.

When called on a hash, `include?` only checks the keys, not the values.

In fact, `Hash#include?` is essentially an alias for `Hash#key?` or `Hash#has_key?`. In practice, Rubyists would usually prefer these methods over `include?` as they make the intention more explicit.

If we wanted to find out if a value exists within a hash, we could use the `Hash#value?` or `Hash#has_value?` methods: `hash.has_value?('cat')`.



#### `Enumerable#partition`

`partition` divides up elements in the current collection into two collections, depending on the block's return value. The return value is a nested array, with the inner arrays separated based on the return value of the block.

This method returns two arrays, the first will contain elements from the original collection if the block evaluates to true and the second contains everything else.

Even if the collection is a hash, the return value of `partition` will always be an array. To transform these arrays back into a hash, we can invoke `Array#to_h`.



#### `reject`

This demonstrates that `reject` considers the return value of the block, specifically its truthiness, and returns a new array based on it. If the return value evaluates to `false` the element is selected. 



#### `uniq`

returns a new array by removing duplicate values in the calling object



#### `dup`

duplicates the object but not the frozen status.



#### `clone`

duplicates with the frozen status.



#### `freeze`

Only freezes the element called on. If called on a collection each collection object needs to be frozen or else each element can be mutated



#### `Numeric#divmod`

divmod(numeric) → array

Returns an array containing the quotient and modulus obtained by dividing `num` by `numeric`.



#### Array#shift

shift → obj or nil

shift(n) → new_ary

Removes the first element of `self` and returns it (shifting all other elements down by one). Returns `nil` if the array is empty.

If a number `n` is given, returns an array of the first `n` elements (or less) just like `array.slice!(0, n)` does. With `ary` containing only the remainder elements, not including what was shifted to `new_ary`. See also [#unshift](https://ruby-doc.org/core-2.7.2/Array.html#method-i-unshift) for the opposite effect.

```Ruby
args = [ "-m", "-q", "filename" ]
args.shift     #=> "-m"
args           #=> ["-q", "filename"]

args = [ "-m", "-q", "filename" ]
args.shift(2)  #=> ["-m", "-q"]
args           #=> ["filename"]
```



#### Array#unshift

unshift(obj, ...) → ary

prepend(obj, ...) → ary

Prepends objects to the front of `self`, moving other elements upwards. See also [#shift](https://ruby-doc.org/core-2.7.2/Array.html#method-i-shift) for the opposite effect.

```
a = [ "b", "c", "d" ]
a.unshift("a")   #=> ["a", "b", "c", "d"]
a.unshift(1, 2)  #=> [ 1, 2, "a", "b", "c", "d"]
```