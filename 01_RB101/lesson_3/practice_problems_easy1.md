

# Practice Problems: Easy 1

#### Question 1

What would you expect the code below to print out?

```ruby
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
```

Solution 1



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

------

#### Question 3

Replace the word "important" with "urgent" in this string:

```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```

Solution 3

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

------

#### Question 5

Programmatically determine if 42 lies between 10 and 100.

*hint: Use Ruby's range object in your solution.*

Solution 5

------

#### Question 6

Starting with the string:

```ruby
famous_words = "seven years ago..."
```

show two different ways to put the expected "Four score and " in front of it.

Solution 6

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

------

#### Question 8

Given the hash below

```ruby
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
```

Turn this into an array containing only two elements: Barney's name and Barney's number