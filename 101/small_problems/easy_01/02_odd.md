# 2. Odd

Write a method that takes one integer argument, which may be positive, negative, or zero. This method returns `true` if the number's absolute value is odd. You may assume that the argument is a valid integer value.

Examples:

```ruby
puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
```

Keep in mind that you're not allowed to use `#odd?` or `#even?` in your solution.



**Solution**

```ruby
# Solution 1
def is_odd?(number)
    number % 2 != 0
end

# Solution 2
def is_odd?(number)
    number % 2 == 1
end

# Solution 3
def is_odd?(number)
    number.remainder(2) != 0
end

# Solution 4
def is_odd?(number)
	odd_remainder = number.remainder(2)
  number > 0 ? odd_remainder == 1 : odd_remainder == -1
end

p is_odd?(2) == false
p is_odd?(5) == true
p is_odd?(-17) == true
p is_odd?(-8) == false
p is_odd?(0) == false
p is_odd?(7) == true
```

remainder(numeric) → real

Returns the remainder after dividing `int` by `numeric`.

**Remainder operators return negative results if the number on the left is negative, while modulo always returns a non-negative result if the number on the right is positive.**

| modulo            | remainder         |
| :---------------- | :---------------- |
| `5 mod 2 == 1`    | `5 rem 2 == 1`    |
| `-5 mod 2 == 1`   | `-5 rem 2 == -1`  |
| `5 mod -2 == -1`  | `5 rem -2 == 1`   |
| `-5 mod -2 == -1` | `-5 rem -2 == -1` |

