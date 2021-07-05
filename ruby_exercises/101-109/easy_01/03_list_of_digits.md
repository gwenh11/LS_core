# 3. List of Digits

Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

Examples:

```ruby
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
```



**Solution**

```ruby
# assume input number is a possitve integer
# the digits in the array is the same order as in the input number
# make an empty array digits
# assign 'current number' to input number
# perform modulo between 'current number' and 10, store remainder
# push the remainder to digit
# divide number by 10, store the result in 'quotient'
# assign 'quotient' to 'current number'
# repeat line 3 to 7 while 'current number' is greater than 0

def digit_list(number)
  digits = []
  current_number = number
  while current_number > 0
    remainder = current_number % 10
    digits << remainder
    quotient = current_number / 10
    current_number = quotient
  end
  digits.reverse
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
```

**LS Solution**

```ruby
# Brute force
def digit_list(number)
    digits = []
    loop do
        number, remainder = number.divmod(10)
      	# returns [1234, 5]
        # use parallel assignment to assign values to number and remainder
        digits.unshift(remainder)
        # prepend remainder to digits array
        break if number == 0
    end
    digits
end

# Idiomatic
# Conver number to string, then to an array of characters
# Map over the array and covert each string to integer
def digit_list(number)
    number.to_s.chars.map(&:to_i)
end
# &:to_i is syntactical sugar for:
# number.to_s.chars.map {|char| char.to_i}
        
```

