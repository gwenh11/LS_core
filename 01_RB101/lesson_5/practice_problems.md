# Practice Problems: Sorting, Nested Collections and Working with Blocks

When faced with a coding problem that requires you to iterate through a complex nested collection it is important to focus on:

- What is happening at each *level* of iteration
- What each method does with the return value of the block
- What the method itself returns
- What is ultimately returned by the initial method call

#### Practice Problem 1

How would you order this array of number strings by descending numeric value?

```ruby
arr = ['10', '11', '9', '7', '8']
```

**Solution**

```ruby
arr.sort do |a,b|
  b.to_i <=> a.to_i
end
# => ["11", "10", "9", "8", "7"]
```

------

#### Practice Problem 2

How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?

```ruby
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]
```

**Solution**

```ruby
books.sort_by do |book|
  book[:published]
end
# => [
# {:title=>"War and Peace", :author=>"Leo Tolstoy", :published=>"1869"},
# {:title=>"Ulysses", :author=>"James Joyce", :published=>"1922"},
# {:title=>"The Great Gatsby", :author=>"F. Scott Fitzgerald", :published=>"1925"},
# {:title=>"One Hundred Years of Solitude", :author=>"Gabriel Garcia Marquez", :published=>"1967"}
# ]
# Since all the year values of publication in question are four characters in length, in this case we can simply compare the strings without having to convert them to integers.
```

------

#### Practice Problem 3

For each of these collection objects demonstrate how you would reference the letter `'g'`.

```ruby
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
```

**Solution**

```ruby
arr1[2][1][3]
arr2[1][:third][0]
arr3[2][:third][0][0] # arr3[2][:third][0] returns "ghi"
hsh1['b'][1]
hsh2[:third].key(0) # hsh2[:third] returns {'g' => 0}, invoke #key to find the key at value 0
```

Note: the `Hash#key` method returns the key of an occurrence of a given value. A couple of things to note when using this method:

- If more than one key has the same value the method returns the key for the first occurrence of that value.
- If the requested value does not exist in the hash then `nil` is returned.

```ruby
hsh2[:third].keys[0] # => 'g'
```

Although this looks very similar to the initial solution, `Hash#key` and `Hash#keys` are actually two completely different methods. `Hash#key` returns a single key based on a value passed to the method. `Hash#keys` returns an array of all the keys in the hash, and the `[0]` is then referencing the object at index `0` of that returned array.

------

#### Practice Problem 4

For each of these collection objects where the value `3` occurs, demonstrate how you would change this to `4`.

```ruby
arr1 = [1, [2, 3], 4]

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

hsh1 = {first: [1, 2, [3]]}

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
```

**Solution**

```ruby
arr1[1][1] = 4
arr1 # => [1, [2, 4], 4]

arr2[2] = 4
arr2 # => [{:a=>1}, {:b=>2, :c=>[7, 6, 5], :d=>4}, 4]

hsh1[:first][2][0] = 4
hsh1 # => {:first=>[1, 2, [4]]}

hsh2[['a']][:a][2] = 4
hsh2 # => {["a"]=>{:a=>["1", :two, 4], :b=>4}, "b"=>5}
```

------

#### Practice Problem 5

Given this nested Hash:

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
```

figure out the total age of just the male members of the family.

**Solution**

```ruby
total_male_age = 0
munsters.each_value do |attributes|
    total_male_age += attributes["age"] if attributes["gender"] == "male"
end

total_male_age # => 444
```

------

#### Practice Problem 6

One of the most frequently used real-world string properties is that of "string substitution", where we take a hard-coded string and modify it with various parameters from our program.

Given this previously seen family hash, print out the name, age and gender of each family member:

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
```

...like this:

```none
(Name) is a (age)-year-old (male or female).
```

**Solution**

```ruby
munsters.each do |name, attributes|
    puts "#{name} is a #{attributes['age']} year old #{attributes['gender']}"
```

------

#### Practice Problem 7

Given this code, what would be the final values of `a` and `b`? Try to work this out without running the code.

```ruby
a = 2
b = [5, 8]
arr = [a, b] # arr = [2, [5, 8]]

arr[0] += 2 # arr = [4, [5, 8]] - modifying the array arr by asigning a new object at index 0 of the array arr
arr[1][0] -= a # arr = [4, [3, 8]] - modifying the array arr by assinging a new object at index 0 of the inner array
# a and b remains unchanged
```

------

#### Practice Problem 8

Using the `each` method, write some code to output all of the vowels from the strings.

```ruby
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
```

**Solution**

```ruby
vowels = 'aeiou'
hsh.each_value do |details|
  details.each do |word|
    word.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end
# e
# u
# i
# o
# o
# u
# e
# o
# e
# e
# a
# o
```

------

#### Practice Problem 9

Given this data structure, return a new array of the same structure but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

```ruby
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
```

**Solution**

```ruby
arr.map do |sub_arr|
  sub_arr.sort do |a, b|
    b <=> a
  end
end
# => [["c", "b", "a"], [3, 2, 1], ["green", "blue", "black"]]
```

------

#### Practice Problem 10

Given the following data structure and without modifying the original array, use the `map` method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.

```ruby
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
```

**Solution**

```ruby
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end
# => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]
```

------

#### Practice Problem 11

Given the following data structure use a combination of methods, including either the `select` or `reject` method, to return a new array identical in structure to the original but containing only the integers that are multiples of `3`.

```ruby
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
```

**Solution**

```ruby
# needs to #map because we need to return a new array
arr.map do |element|
  element.select do |num|
    num % 3 == 0
  end
end

arr.map do |element|
  element.reject do |num|
    num % 3 != 0
  end
end
# => [[], [3], [9], [15]]
```

------

#### Practice Problem 12

Given the following data structure, and **without** using the `Array#to_h` method, write some code that will return a hash where the key is the first item in each sub array and the value is the second item.

```ruby
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
```

**Solution**

```ruby
hash = {}
arr.each do |sub_arr|
  hash[sub_arr[0]] = sub_arr[1]
end

hash
# => {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
```

------

#### Practice Problem 13

Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically by only taking into consideration the *odd* numbers they contain.

```ruby
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
```

The sorted array should look like this:

```ruby
[[1, 8, 3], [1, 6, 7], [1, 4, 9]]
```

**Solution**

```ruby
arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end
# => [[1, 8, 3], [1, 6, 7], [1, 4, 9]]
```

Since the sub-arrays are compared in an 'element-wise' manner when being sorted, when looking at the first element of each they are all equal. If we were to include the second element of each (the even integers) in our comparison the order would be different, since `4` is less than `6`, which is less than `8`.

**By performing selection on the sub-arrays that we are comparing, we can compare them based on the value of the odd integers alone.**

------

#### Practice Problem 14

Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

```ruby
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
```

The return value should look like this:

```ruby
[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
```

**Solution**

```ruby
# map is an enumerable method and returns an array given a block
hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map do |color|
      color.capitalize
    end
  elsif value[:type] == 'vegetable'
    value[:size].upcase
  end
end
# => [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
```

From the problem description we know that we want to return an array where each item in the outer hash is represented by a particular value from within each nested hash, so `map` is a good choice of method to call on the initial `hsh` object.

Since the value to be returned to `map` by the outer block depends on whether `:type` equates to `fruit` or `vegetable`, we need to use a conditional statement to determine what is returned and what other actions are performed on those values prior to them being returned by the outer block.

The situation for `:colors` is complicated slightly in that we want to call `capitalize` on the strings but they are nested within arrays so we need to iterate through those arrays in order to access them.

------

#### Practice Problem 15

Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

```ruby
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
```

**Solution**

```ruby
arr.select do |hsh|
  hsh.all? do |_, value|
    value.all? do |num|
      num.even?
    end
  end
end
# => [{:e=>[8], :f=>[6, 10]}]
```

From the problem description it is clear that we will need to return a subset of the objects in the outer array, so `select` should hopefully be a fairly obvious method choice to call on that array. The key is then to figure out how to carry out the selection.

Since `select` will return all the elements for which the block returns `true` and we only want hashes where **all** the integers are even, `all?` combined with `even?` is a good choice here. The situation is complicated slightly by the fact that the integers are further nested inside the inner arrays, so we need to iterate through these first.

If all of the integers in an inner array are even then the inner block returns `true` to the innermost call to `all?`. If all of the inner blocks for a particular hash return `true` then the middle block returns `true` to the outer call to `all?` which in turn causes the outer block to return `true` to the `select` method for that iteration.

------

#### Practice Problem 16

A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created by the same system. That is, without any form of synchronization, two or more separate computer systems can create new items and label them with a UUID with no significant chance of stepping on each other's toes.

It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

It looks like this: `"f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"`

Write a method that returns one UUID when called with no parameters.

**Solution**

```ruby
def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end
```

The key to this solution is having the `sections` array containing integers representing the number of characters in each section. During each iteration through the array, within the block we can call the `times` method on the integer for that iteration and thus build up the UUID character by character.

This is just one possible solution to the problem, and yours may be different. However you solved it though, you will most likely have needed to use one or more iterative methods.

Our solution ignores some complexity concerning the proper way to generate UUIDs. It has a higher probability of creating conflicting values than you might think. See the [RFC 4122](https://tools.ietf.org/html/rfc4122) document for complete details about how to properly generate UUIDs. Better yet, use an RFC 4122-compliant implementation of the algorithm, such as the `SecureRandom#uuid` method in Ruby's standard library.