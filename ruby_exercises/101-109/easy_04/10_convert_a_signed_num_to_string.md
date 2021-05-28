# 10. Convert a Signed Number to a String!
In the previous exercise, you developed a method that converts non-negative numbers to strings. In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.

Examples

```ruby
signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'
```

**Solution**

create a constant array of digits (as string)
determine the sign in front of number:
  if number is positive, include negative sign in result
  if number is negative, include negative sign in result
  if number is zero, return empty

convert num to string:
  init result string as empty
  create a loop
    find quotient and remainder when divide the absolute lue of number by 10
    assign quotient as the current number for the next execution
    find the value of the digits constant string at remainder as index
    repeat until number equals to 0
  return result

return the concatenation of sign and result together

```ruby
DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def signed_integer_to_string(number)
  if number > 0
    sign = '+'
  elsif number < 0
    sign = '-'
  else
    sign = ''
  end

  result = ''
  loop do
    number, remainder = number.abs.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end

  sign.concat(result)
end
```

**LS Solution**
```ruby
def signed_integer_to_string(number)
  # use the spaceship operator to compare number with 0
  case number <=> 0
  when -1 then "-#{integer_to_string(-number)}"
  when +1 then "+#{integer_to_string(number)}"
  else         integer_to_string(number)
  end
end
```

**Further Exploration**

Refactor our solution to reduce the 3 integer_to_string calls to just one.

```ruby
def signed_integer_to_string(number)
  if number > 0
    sign = '+'
  elsif number < 0
    sign = '-'
  else
    sign = ''
  end

  sign.concat(integer_to_string(number.abs))
end
```
