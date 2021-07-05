# Practice Problems: Hard 1

#### Question 1

What do you expect to happen when the `greeting` variable is referenced in the last line of the code below?

```ruby
if false
  greeting = “hello world”
end

greeting
```

Solution 1

"Undefined method or local variable" exception is thrown, because `greeting` is nil. The `if` block doesn't get executed before `greeting` is referenced. 

------

#### Question 2

What is the result of the last line in the code below?

```ruby
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings
```

Solution 2

```ruby
{a: 'hi there'}
```

`informal_greeting` is reference to the original object. `String#<<` is a destructive method, thus impacts the value of `greetings`

If we wanted to only modify `informal_greeting` but not `greetings`:

- use string concatenation `informal_greeting += 'there'`
- use `#clone` - a shallow copy of the same value and assign it to `informal_greeting` `informal_greeting = greetings[:a].clone`

------

#### Question 3 and Solution

In other practice problems, we have looked at how the scope of variables affects the modification of one "layer" when they are passed to another.

To drive home the salient aspects of variable scope and modification of one scope by another, consider the following similar sets of code.

What will be printed by each of these code groups?

A)

```ruby
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)
# despite having the same name, the variables outside of the method definition cannot be changed by the method definition

puts "one is: #{one}" #=> one is one
puts "two is: #{two}" #=> two is two
puts "three is: #{three}" #=> three is three

```

B)

```ruby
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" #=> one is one
puts "two is: #{two}" #=> two is two
puts "three is: #{three}" #=> three is three
```

C)

```ruby
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end
# gsub! is destructive and mutates the orignal strings

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" #=> one is two
puts "two is: #{two}" #=> two is three
puts "three is: #{three}" #=> three is one
```

------

#### Question 4

Ben was tasked to write a simple ruby method to determine if an input string is an IP address representing dot-separated numbers. e.g. "10.4.5.11". He is not familiar with regular expressions. Alyssa supplied Ben with a method called `is_an_ip_number?` that determines if a string is a numeric string between `0` and `255` as required for IP numbers and asked Ben to use it.

```ruby
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end
```

Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things. You're not returning a false condition, and you're not handling the case that there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

Help Ben fix his code.

Solution 4

```ruby
# valid ip address - each number separated by a dot represents an ip number and there needs to be four numbers

# split input string, which returns an array of words
# if array of words size is less than 4, returns false
# if array of words size equals 4 
#	iterate through array of words
#	check to see if substring is an ip number
# 	if all substrings are ip number, return true. Otherwise, false

def dot_separated_ip_address?(input_string)
    dot_separated_words = input_string.split(".")
    dot_separated_words_size = dot_separated_words.size
    if dot_separated_words_size < 4
        false
    elsif dot_separated_words_size == 4
        dot_separated_words.all? {|word| is_an_ip_number?(word)}
    end
end

#***LS solution
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end
    
```

