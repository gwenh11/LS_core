

# Practice Problems: Easy 1

#### Question 1

What would you expect the code below to print out?

```ruby
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
```

Solution 1

Method `Array#uniq` returns a new array by removing duplicate values in `number` . Elements in `numbers` aren't modified. In addition, the `Kernel#puts` automatically calls `to_s` on its argument. The expected output is below:

```
1
2
2
3
```

------

#### Question 2

Describe the difference between `!` and `?` in Ruby. And explain what would happen in the following scenarios:

1. what is `!=` and where should you use it?
2. put `!` before something, like `!user_name`
3. put `!` after something, like `words.uniq!`
4. put `?` before something
5. put `?` after something
6. put `!!` before something, like `!!user_name`

Solution 2

1. != means not equal and is used in a conditional. Conditionals are basic logic structures that are defined with the reserved words `if` , `else` , `elsif` , and `end` . Conditionals are formed using a combination of `if` statements, comparison and logical operators `(<, >, <=, >=, ==, !=. &&, ||)` . Conditionals return a boolean value. 

2. Put `!` before something turns object into the opposite of their boolean equivalent. 

   ```ruby
   user_name = "gwen"
   !user_name # => false ("gwen" is truthy)
   !!user_name # => true
   user_name = nil
   !user_name # => true
   !!user_name # => false
   ```

3. Put `!` after something doesn't do anything, because it's part of the method name. We have to check method implementation to see what the method is doing. 

4. Put `?` before something - the ternary operator for if..else

5. Put `?` after something - same as number 3.

6. Put `!!` before something turns any object into their boolean equivalent. 

------

#### Question 3

Replace the word "important" with "urgent" in this string:

```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```

Solution 3

```ruby
advice.gsub!('important', 'urgent')
```

------

#### Question 4

The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

```ruby
numbers = [1, 2, 3, 4, 5]
```

What do the following method calls do (assume we reset `numbers` to the original array between method calls)?

```ruby
numbers.delete_at(1)
numbers.delete(1)
```

Solution 4

These methods modify the array in place rather than returning a new modified array. These methods are destructive.

```ruby
numbers.delete_at(1) # numbers is now [1, 3, 4, 5]
numbers.delete(1) # numbers is now [2, 3, 4, 5]
```

The first method removes element at index 1 of the array, meaning `2` is removed.

The second method removes all elements `1` from the array. There is only one element `1` in the array, so only `1` is removed. 

------

#### Question 5

Programmatically determine if 42 lies between 10 and 100.

*hint: Use Ruby's range object in your solution.*

Solution 5

```ruby
(10..100).cover?(42) # include method still works
```



------

#### Question 6

Starting with the string:

```ruby
famous_words = "seven years ago..."
```

show two different ways to put the expected "Four score and " in front of it.

Solution 6

```ruby
"Four score and " + famous_words
famous_words.prepend("Four score and ")
"Four score and " << famous _words
```



------

#### Question 7

If we build an array like this:

```ruby
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
```

We will end up with this "nested" array:

```ruby
["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
```

Make this into an un-nested array.

Solution 7

```ruby
flintstones.flatten!
```



------

#### Question 8

Given the hash below

```ruby
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
```

Turn this into an array containing only two elements: Barney's name and Barney's number

Solution 8

```ruby
flinstones.assoc("Barney") #=> ["Barney", 2]
```

`Hash#assoc` searches the hash and comparing the object with the key. If found, return a key-value pair (two elements array). Otherwise, return `nil`.