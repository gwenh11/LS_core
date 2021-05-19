# Halvsies

Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

Examples:

```ruby
halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]
```

**Solution**

```ruby
def halvsies(arr)
  half = arr.size / 2
  if arr.size.even?
    first_half = arr.slice(0, half)
    second_half = arr.slice(half, half)
  else
    first_half = arr.slice(0, half + 1)
    second_half = arr.slice(half + 1, half)
  end
  
  [first_half, second_half]
end
```

**LS Solution**

```ruby
def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end
```

#### Further Exploration

Can you explain why our solution divides `array.size` by 2.0 instead of just 2?

Because when `array.size` is an odd number and no evenly divisible by 2, division by 2.0 will produce a float result which can be rounded up with `ceil` method.

This is but one way to solve this problem. What solution did you end up with? Was it similar or entirely different?