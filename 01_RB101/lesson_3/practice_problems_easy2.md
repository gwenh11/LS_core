

# Practice Problems: Easy 2

#### Question 1

In this hash of people and their age,

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
```

see if "Spot" is present.

**Bonus:** What are two other hash methods that would work just as well for this solution?

Solution 1

To check if "Spot" is present: ages.include?("Spot")

Two similar methods are: Hash#has_key? and Hash#key?

LS solution shows Hash#member?, which is also a good method to use. 

------

#### Question 2

Starting with this string:

```ruby
munsters_description = "The Munsters are creepy in a good way."
```

Convert the string in the following ways (code will be executed on original `munsters_description` above):

```none
"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"The munsters are creepy in a good way."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."
```

Solution 2

First example: capitalize all letters, then replace capital 'T' and 'M' with lower case letters. In other words, the case of 'T' and 'M' are flipped.

LS solution.

```
munster_description.swapcase!
```

The following code yields a similar result, but the return value is a new string. The original string isn't mutated. When it comes to conversion, it means to mutate the caller. 

```ruby
munsters_description.upcase.gsub(/[TM]/) {|s| s.downcase}
```

Second example: capitalize the first letter of the sentence.

```
munsters_description.capitalize!
```

Third example: all letters are lowercase

```
munsters_description.downcase!
```

Fourth example: all letters are uppercase

```
munsters_description.upcase!
```

------

#### Question 3

We have most of the Munster family in our age hash:

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
```

add ages for Marilyn and Spot to the existing hash

```ruby
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
```

Solution 3

```ruby
ages.merge!(additional_ages)
```



------

#### Question 4

See if the name "Dino" appears in the string below:

```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```

Solution 4

------

#### Question 5

Show an easier way to write this array:

```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
```

Solution 5

------

#### Question 6

How can we add the family pet "Dino" to our usual array:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

Solution 6

------

#### Question 7

In the previous practice problem we added Dino to our array like this:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
```

We could have used either `Array#concat` or `Array#push` to add Dino to the family.

How can we add multiple items to our array? (Dino and Hoppy)

Solution 7

------

#### Question 8

Shorten this sentence:

```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```

...remove everything starting from "house".

Review the [String#slice!](http://ruby-doc.org/core/String.html#method-i-slice-21) documentation, and use that method to make the return value `"Few things in life are as important as "`. But leave the `advice` variable as `"house training your pet dinosaur."`.

As a bonus, what happens if you use the [String#slice](http://ruby-doc.org/core/String.html#method-i-slice) method instead?

Solution 8

------

#### Question 9

Write a one-liner to count the number of lower-case 't' characters in the following string:

```ruby
statement = "The Flintstones Rock!"
```

Solution 9

------

#### Question 10

Back in the stone age (before CSS) we used spaces to align things on the screen. If we had a 40 character wide table of Flintstone family members, how could we easily center that title above the table with spaces?

```ruby
title = "Flintstone Family Members"
```

Solution 10