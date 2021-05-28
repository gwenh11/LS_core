# 8. Next Featured Number Higher than a Given Value

A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, `49` is a featured number, but `98` is not (it is not odd), `97` is not (it is not a multiple of 7), and `133` is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.

Examples:

```ruby
featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
```

**Solution**

```ruby
=begin
feature number is: 
- an odd number
- multiple of 7
- no duplicate digits
=end

def featured(num)
  if num == 9_999_999_999
    return "There is no possible number that fulfills those requirements"
  end

  loop do
    num += 1
    break if featured_num?(num)
  end
  num
end

def featured_num?(num)
  num % 7 == 0 && num.odd? && unique_num?(num)
end

def unique_num?(num)
  check = []
  num.to_s.chars.each do |digit|
    return false if check.include?(digit)
    check << digit
  end
  true
end

=begin
def unique_num?(n)
  n.digits.reverse.uniq.join.to_i == n ? false : true
end
=end
```

**LS Solution**

```ruby
def featured(number)
  # find number that is odd and divisble by 7 first
  number += 1
  number += 1 until number.odd? && number % 7 == 0
	
  # take the number from earlier and check to see if it is unique
  # if so, return the number. Otherwise, increment it by 14
  # it has to be 14, so that the next number is an odd number
  # Incrementing by 7, the next number will be an even number
  loop do
    number_chars = number.to_s.split('')
    return number if number_chars.uniq == number_chars
    number += 14
    break if number >= 9_876_543_210
  end

  'There is no possible number that fulfills those requirements.'
end
```

