# 8. Convert a String to a Signed Number!

In the previous exercise, you developed a method that converts simple numeric strings to Integers. In this exercise, you're going to extend that method to work with signed numbers.

Write a method that takes a String of digits, and returns the appropriate number as an integer. The String may have a leading `+` or `-` sign; if the first character is a `+`, your method should return a positive number; if it is a `-`, your method should return a negative number. If no sign is given, you should return a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby, such as `String#to_i`, `Integer()`, etc. You may, however, use the `string_to_integer` method from the previous lesson.

Examples

```ruby
string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100
```

**Solution**

```ruby
NUMBERS_HASH = ('0'..'9').zip(0..9).to_h

def string_to_integer(num_str)
  numbers_array = []
  num_str.each_char.with_index { |char, idx| numbers_array[idx] = NUMBERS_HASH[char] }
  numbers_array.inject(0) { |num, dig| (num * 10) + dig }
end

def string_to_signed_integer(num_str)
  no_sign_num = string_to_integer(num_str.delete('-+'))
  num_str[0] == '-' ? -no_sign_num : no_sign_num
end
```

**LS Solution**

```ruby
def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then string_to_integer(string[1..-1])
  else          string_to_integer(string)
  end
end
```

#### Further Exploration

In our solution, we call `string[1..-1]` twice, and call `string_to_integer` three times. This is somewhat repetitive. Refactor our solution so it only makes these two calls once each.

```ruby
def string_to_signed_integer(num_str)
  multiplier = 1
  multiplier = -1 if num_str[0] == '-'
  multiplier * string_to_integer(num_str[1..-1])
end
```

