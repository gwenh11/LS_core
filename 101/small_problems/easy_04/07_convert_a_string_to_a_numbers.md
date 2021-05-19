# 7. Convert a String to a Number!

The `String#to_i` method converts a string of numeric characters (including an optional plus or minus sign) to an `Integer`. `String#to_i` and the `Integer` constructor (`Integer()`) behave similarly. In this exercise, you will create a method that does the same thing.

Write a method that takes a String of digits, and returns the  appropriate number as an integer. You may not use any of the methods  mentioned above.

For now, do not worry about leading `+` or `-` signs, nor should you worry about invalid characters; assume all characters will be numeric.

You may not use any of the standard conversion methods available in Ruby, such as `String#to_i`, `Integer()`, etc. Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

Examples

```ruby
string_to_integer('4321') == 4321
string_to_integer('570') == 570
```

#### Further Exploration

Write a `hexadecimal_to_integer` method that converts a string representing a hexadecimal number to its integer value.

Example:

```ruby
hexadecimal_to_integer('4D9f') == 19871
```

**Solution**

```ruby
def create_str_int_hash
  str = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
  str.zip((0..9).to_a).to_h
end

def string_to_integer(string)
  str_int = create_str_int_hash
  digits = []
  string.each_char do |char|
    digits << str_int[char]
  end
  
  digits.reverse!
  integer = 0
  digits.size.times do |n|
    integer += digits[n] * (10**n)
  end
    
  integer
end
```

```ruby
# Shorter way to make the number hash
# DIGIT_HASH = Hash[('0'..'9').to_a.zip((0..9).to_a)]
NUMBERS_HASH = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9}

def string_to_integer(num_str)
  numbers_array = []
  num_str.each_char.with_index {|char, idx| numbers_array[idx] = NUMBERS_HASH[char]}
  numbers_array.inject(0) {|num, dig| (num * 10) + dig}
end
```



**LS Solution**

```ruby
DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  # this way I didn't have to reverse the array
  # 10 * 0 + 4 -> 4
  # 10 * 4 + 3 -> 43
  # 10 * 43 + 1 -> 431
  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end
# digits.inject(0) {|value, digit| 10 * value + digit}

```

