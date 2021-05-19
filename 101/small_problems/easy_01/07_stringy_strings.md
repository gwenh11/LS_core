# 7. Stringy Strings

Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

Examples:

```ruby
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
```

The tests above should print `true`.

**Solution**

```ruby
=begin
Problem: 
- write a method that takes a positive integer and returns a string
- string is alternating 1s and 0s, always start with 1
- length of string matches the given integer
Impilicit rules: none

Example:
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

Data Structures:
Input: Integer (positive)
Output: String

Algorithm:
Observation: string can be accessed via indexes, so 0 or even index values are 1 and odd index values are 0. I can use #times method to iterate from 0 to the given interger number of times

1. Intialize empty result string 
2. Iterate from 0 to the given integer of times
3. If iterating time is 0 or even, push string '1' to result string
4. Otherwise, push string '0' to result string
5. Return result string

Code:
=end

def stringy(pos_integer)
  result = ''
  pos_integer.times do |time|
    time % 2 == 0 ? result.concat('1') : result.concat('0')
  end
  result
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
```

LS solution uses array to hold the binary numbers and use the `#join` method to join the elements and return a string

```ruby
def stringy(size)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  numbers.join
end
```

**Further Exploration:**

Modify `stringy` so it takes an additional optional argument that defaults to `1`. If the method is called with this argument set to `0`, the method should return a String of alternating 0s and 1s, but starting with `0` instead of `1`.

```ruby
=begin
--> Code modfication
- Assign current value as 1, alternate as 0.
- if the second argument is set to 0, reassign current value as 0, alternate as 1. 
- Change string concatenation to current value at even indexes and alternate at odd indexes. 
=end

def stringy(pos_integer, start_value=1)
  result = ''
  current_value = '1'
  alternate_value = '0'
  if start_value == 0
    current_value = '0'
    alternate_value = '1'
  end

  pos_integer.times do |time|
    if time.even?
      result.concat(current_value)
    else
      result.concat(alternate_value)
    end
  end
  result
end
```

**Other Solutions**

This solution uses an array to store 1 and 0. It shortens the code and makes it easier to read. 

```ruby
def stringy(int, first = 1)
  d = [0, 1]  
  d.reverse! if first == 0

  arr = []
  int.times { |i| i.odd? ? arr << d[0] : arr << d[1] }
  arr.join
end
```

