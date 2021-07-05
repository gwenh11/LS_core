# 2. Rotation (Part 2)

Write a method that can rotate the last `n` digits of a number. For example:

```ruby
rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917
```

Note that rotating just 1 digit results in the original number being returned.

You may use the `rotate_array` method from the previous exercise if you want. (Recommended!)

You may assume that `n` is always a positive integer.

**Solution**

```ruby
def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, n)
  num_arr = number.to_s.split('')
  num_non_rotate = num_arr[0, num_arr.size - n]
  num_rotate = rotate_array(num_arr[-n..-1])
  (num_non_rotate + num_rotate).join.to_i
end
```

**LS Solution**

```ruby
def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end
```

We pass `all_digits[-n..-1]` to our `rotate_array` method from the previous exercise, and that method returns a new array with the digits rotated as needed.

We then assign the return value of `rotate_array` to `all_digits[-n..-1]`. When an expression like this appears on the left side of an assignment, it means, **"replace the last `n` elements with the values to the right of the equal sign"**. And that's exactly what happens here: we replace the last `n` digits with the rotated digits.