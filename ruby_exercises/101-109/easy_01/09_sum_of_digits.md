# 09. Sum of Digits

Write a method that takes one argument, a positive integer, and returns the sum of its digits.

Examples:

```ruby
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
```

The tests above should print `true`.

For a challenge, try writing this without any basic looping constructs (`while`, `until`, `loop`, and `each`).

**Solution**

```ruby
def sum(number)
    number.digits.sum
end
```

**LS Solution**

```ruby
# Solution 1
def sum(number)
    sum = 0
    str_digits = number.to_s.chars
    
    str_digits.each do |str_digit|
        sum += str_digit.to_i
    end
    sum
end

# Solution 2
def sum(number)
    number.to_s.chars.map(&:to_i).reduce(:+)
end
```

There is no easy way to split the number into digits, except for `#digits` method, so we convert number of string, then an array of string characters. After that, we need to convert each string character to an integer so they can be added together to find sum. 

**Syntactic Sugar**

```ruby
["2", "3"].map(&:to_i)

["2", "3"].map { |element| element.to_i }
```

