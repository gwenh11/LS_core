# 2. Double Doubles

A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, `44`, `3333`, `103103`, `7676` are all double numbers. `444`, `334433`, and `107` are not.

Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

Examples:

```ruby
twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10
```

Note: underscores are used for clarity above. Ruby lets you use underscores when writing long numbers; however, it does not print the underscores when printing long numbers. Don't be alarmed if you don't see the underscores when running your tests.

**Solution**

```ruby
def twice(num)
  if is_double?(num)
    num
  else
    num * 2
  end
end

def is_double?(num)
  half = num.to_s.size / 2
  num.to_s[0..half - 1] == num.to_s[half..-1] && half > 0
end
```

**LS Solution**

```ruby
def twice(number)
  string_number = number.to_s
  center = string_number.size / 2
  left_side = center.zero? ? '' : string_number[0..center - 1]
  right_side = string_number[center..-1]

  return number if left_side == right_side
  return number * 2
end
```

