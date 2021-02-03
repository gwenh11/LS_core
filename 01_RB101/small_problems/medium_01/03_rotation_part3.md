# 3. Rotation (Part 3)

If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the `rotate_rightmost_digits` method from the previous exercise.

Note that you do not have to handle multiple 0s.

Example:

```ruby
max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845
```

#### Further Exploration

Assume you do not have the `rotate_rightmost_digits` or `rotate_array` methods. How would you approach this problem? Would your solution look different? Does this 3 part approach make the problem easier to understand or harder? **3 part approach make sit easier to solve**

There is an edge case in our problem when the number passed in as the argument has multiple consecutive zeros. Can you create a solution that preserves zeros?

**We can preserve the leading zeros by keeping the number in a string representation**

```ruby
def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join
end

def max_rotation_str(number)
  number_digits = number.to_s.size
  number_digits.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  number
end
```



**Solution**

```ruby
#352917
#3 29175
#3 2 1759
#3 2 1 597
#3 2 1 5 79

#703 529 146 8
#7 3 529 146 80 - keep the result from previous rotate and implement newrotation
#7 3  29 146 805
#7 3  2  146 8059
#7 3  2  1 6 80594
#7 3  2  1 6 05948
#7 3  2  1 6 0 9485
#7 3  2  1 6 0 9 854
#7 3  2  1 6 0 9 8 45
def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

def max_rotation(number)
  length = number.to_s.size
  current_arr = number

  return number if length <= 1
  loop do
    current_arr = rotate_rightmost_digits(current_arr, length)
    length -= 1
    break if length == 1
  end
  current_arr
end 
```

**LS Solution**

```ruby
def max_rotation(number)
  number_digits = number.to_s.size
  # stop the execution after n = 2
  number_digits.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  number
end
```

Integer#downto(limit) {|i| block } → self

downto(limit) → an_enumerator

Iterates the given block, passing in decreasing values from `int` down to and including `limit`.

If no block is given, an [Enumerator](https://ruby-doc.org/core-3.0.0/Enumerator.html) is returned instead.

```
5.downto(1) { |n| print n, ".. " }
puts "Liftoff!"
#=> "5.. 4.. 3.. 2.. 1.. Liftoff!"
```