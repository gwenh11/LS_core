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