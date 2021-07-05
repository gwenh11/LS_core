# Practice Problems: Additional Practice

At this point you should be comfortable working with collection objects in various different ways. This assignment provides some additional practice problems to help reinforce what you've learned in this lesson and also to allow you to test how well you've absorbed the numerous different concepts from the previous assignments.

**As we've already seen, when working with collections there are often \*a number of different ways\* that you can reach a solution to a particular problem. The solutions to these practice problems provide a suggestion of how each one might be solved but don't be afraid to explore each problem in more depth, perhaps coming up with more than one possible solution and considering the differences and trade-offs between each of them**.

------

#### Practice Problem 1

Given the array below

```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
```

Turn this array into a hash where the names are the keys and the values are the positions in the array.

```ruby
# Solution 1
flintstones.each_with_object({}) do |name, hash| 
  hash[name] = flintstones.index(name)
end

# Solution 2
flintstones_hash = {}
flintstones.each_index do |index|
    flintstones_hash[flinstones[index]] = index
end

# Solution 3
flintstones_hash = {}
counter = 0
while counter < flintstones.size
  flintstones_hash[flintstones[counter]] = counter
  counter += 1
end

# LS Solution
flintstones_hash = {}
flintstones.each_with_index do |name, index|
    flintstones_hash[name] = index
end

# each_index accepts one arguments, whereas each_with_index accepts two arguments. Solution 2 and 3 requires chaining methods together, so they can be a little hard to read. 
```



------

#### Practice Problem 2

Add up all of the ages from the Munster family hash:

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
```

Solution 2

```ruby
# One way is to get an array of values and find sum. The other way is to iterate through a hash (use each method) and add accumulate each value. We can also use each_value instead of each method to iterate through each value of hash. Hash also has each_key method to iterate through each key. 

# Solution 1 (similar to LS solution)
ages.values.reduce(:+)

# LS Solution
total_ages = 0
ages.each { |_,age| total_ages += age } 
# ages.each_value { |age| total_ages += age}
total_ages
```



------

#### Practice Problem 3

In the age hash:

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
```

remove people with age 100 and greater.

Solution 3

```ruby
# Modify the hash, copy pairs that meet the requirements to a new hash or use select to transform the hash

# Solution 1
ages.delete_if { |key, value| value > 100}

# Solution 2
ages_less_than_100 = {}
ages.each do |key, value| 
  if value < 100
    ages_less_than_100[key] = value
  end
end

# Solution 3
ages.select { |key, value| value < 100}

# LS Solution
ages.keep_if { |_, age| age < 100 }
```



------

#### Practice Problem 4

Pick out the minimum age from our current Munster family hash:

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
```

Solution 4

```ruby
# Solution 1 (same LS solution)
ages.values.min

# Solution 2
age_arr = ages.values
age_arr.reduce { |memo, age| memo < age ? memo : age }

# Solution 3 (in case I forget to use reduce)
age_arr = ages.values
min_age = age_arr[0]
age_arr.each do |age|
  if min_age < age
    min_age
  else
    min_age = age
  end
end
```



------

#### Practice Problem 5

In the array:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

Find the index of the first name that starts with "Be"

Solution 5

```ruby
# Solution 1
flintstones.find_index { |name| name.match?('Be')}

# Solution 2
flintstones.select { |name| name.match?('Be')}
flintstones.index(name_find[0])

# Solution 3 (LS Solution)
flintstones.index { |name| name[0, 2] == 'Be'}
```



------

#### Practice Problem 6

Amend this array so that the names are all shortened to just the first three characters:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

Solution 6

```ruby
flintstones.map! { |name| name[0, 3] }
```



------

#### Practice Problem 7

Create a hash that expresses the frequency with which each letter occurs in this string:

```ruby
statement = "The Flintstones Rock"
```

ex:

```ruby
{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
```

Solution 7

```ruby
# Solution 1
# find array of (unique) keys 
# iterate through array of keys, assign key-value pair to hash
hash = {}
char_keys = statement.delete!(' ').split('').uniq
char_keys.each { |char| hash[char] = statement.count(char)}

# Solution 2
# Iterate though string characters. If the character already exist in hash or it is a blank space, skip. Otherwise, add pair to hash
hash = {}
statement.each_char do |char|
  if hash.key?(char) || char == " "
    next
  else
    hash[char] = statement.count(char)
  end
end

# LS Solution
# create an array of alphabet. Iterate through the alphabet, count the frequency of each letter that appears in statement string and add the letter and frequency to a hash.
letters = ('A'..'Z').to_a + ('a'..'z').to_a
result = {}
letters.each do |letter|
    letter_frequency = statement.scan(letter).count
    # scan method returns an array of letter
    result[letter] = letter_frequency if letter_frequency > 0
end
# LS Solution works better in case the string contains special characters. I can add an extra step to delete the special characters in the string in my solutions. 
```



------

#### Practice Problem 8

What happens when we modify an array while we are iterating over it? What would be output by this code?

```ruby
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
#=> 1
#=> 3
```

What would be output by this code?

```ruby
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
#=> 1
#=> 2
```

Solution 8

------

#### Practice Problem 9

As we have seen previously we can use some built-in string methods to change the case of a string. A notably missing method is something provided in Rails, but not in Ruby itself...`titleize`. This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title. For example, the string:

```ruby
words = "the flintstones rock"
```

would be:

```ruby
words = "The Flintstones Rock"
```

Write your own version of the rails `titleize` implementation.

Solution 9

```ruby
# Solution 1
def titleize(phrase)
  new_phrase = phrase.split.map { |word| word.capitalize }
  new_phrase.join(' ')
end

# Solution 2
def titleize(phrase)
  chars_arr = phrase.chars
  chars_arr.each_index do |index|
    if index == 0
      chars_arr[index].capitalize!
    elsif chars_arr[index] == ' '
      chars_arr[index+1].capitalize!
    end
  end
  chars_arr.join
end

# LS Solution (similar to Solution 1)
words.split.map { |word| word.capitalize }.join(' ')
```



------

#### Practice Problem 10

Given the `munsters` hash below

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
```

Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below

```ruby
{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
```

Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

Solution 10

```ruby
munsters.each_value do |value|
  case value["age"]
  when 0..17
    value["age_group"] = "kid"
  when 18..64
    value["age_group"] = "adult"
  else
    value["age_group"] = "senior"
  end
end
# This is probably the most precise solution I can think of. The other way is to use if conditional, but it's longer
```

