# 9. Convert a Number to a String!
In the previous two exercises, you developed methods that convert simple numeric strings to signed Integers. In this exercise and the next, you're going to reverse those methods.

Write a method that takes a positive integer or zero, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. Your method should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

Examples

```ruby
integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'
```
**Solution**

```ruby
p DIGITS = ('0'..'9').to_a

def integer_to_string(num)
  result = ''
  loop do
    remainder = num.remainder(10)
    result.prepend(DIGITS[remainder])
    num /= 10
    break if num == 0
  end
  
  result
end
```

**LS Solution**

```ruby
DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  result = ''
  loop do
      number, remainder = number.divmod(10)
      result.prepend(DIGITS[remainder])
      break if number == 0
  end
  result
end
```

#### Further Exploration

One thing to note here is the `String#prepend` method; unlike most string mutating methods, the name of this method does not end with a `!`. However, it is still a mutating method - it changes the string in place.

This is actually pretty common with mutating methods that do not have a corresponding non-mutating form. `chomp!` ends with a `!` because the non-mutating `chomp` is also defined. `prepend` does not end with a `!` because there is no non-mutating form of `prepend`.

How many mutating `String` methods can you find that do not end with a `!`. Can you find any that end with a `!`, but don't have a non-mutating form? Does the `Array` class have any methods that fit this pattern? How about the `Hash` class?

Referencing Bob Rodes's answer since it's very thorough.

"Anyway, for the further exploration section, I went over the doc and came up with some answers. First, I don't see any "bang" methods that do not have a non-mutating counterpart for any of the three objects (String, Array and Hash). For the mutating methods that don't have a bang, I came up with quite a few. Several of them are aliases for "bang" methods, but most are not.

String:

- `#clear`
- `#concat`
- `#replace`
- `#insert`
- `#prepend`

Hash:

- `#clear`
- `#delete`
- `#delete_if` (same as #reject!)
- `#keep_if (same as #select!)`
- `#rehash` (this one is interesting, and "sort of" mutates the original)
- `#replace`
- `#shift`
- `#store`
- `#update` (same as #merge!)

Array:

- `#append` (same as #push)
- `#clear`
- `#concat`
- `#delete`
- `#delete_at`
- `#delete_if` (same as #reject!)
- `#fill`
- `#insert`
- `#keep_if` (same as #select!)
- `#pop`
- `#prepend` (same as #unshift)
- `#shift`

I notice that all of these have to do with adding to and/or removing the elements in an array (thinking of a string as a sort of pseudo-array of character elements here), rather than altering the elements themselves in place. So, #upcase! alters the elements themselves, while #clear wipes them all out."