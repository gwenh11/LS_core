# 3. Valid Series?

The `valid_series?` method checks whether a series of numbers is valid. For the purposes of this exercise, a valid series of numbers must contain exactly three odd numbers. Additionally, the numbers in the series must sum to 47.

Unfortunately, our last test case is not returning the expected result. Why is that?

```ruby
def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count = 3 ? true : false
end

p valid_series?([5, 6, 2, 7, 3, 12, 4, 8])        # should return true
p valid_series?([1, 12, 2, 5, 16, 6])             # should return false
p valid_series?([28, 3, 4, 7, 9, 14])             # should return false
p valid_series?([20, 6, 9, 4, 2, 1, 2, 3])        # should return true
p valid_series?([10, 6, 19, 2, 6, 4])             # should return false
```

#### Further Exploration

If you take a close look at `odd_count == 3 ? true : false`, you see that the equality comparison `odd_count == 3` itself returns a Boolean. Is the ternary operator on line 5 really necessary in order to return a Boolean from our method? **The ternary operator on line 5 is not necessary.**

**Solution**

```ruby
def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count == 3 ? true : false
end
```

On line 5 of the original code, `odd_count` is assigned to `3`, which will always be evaluated to a truthy condition in the ternary operator. Therefore, the method returns `true` for all series of numbers that sum to 47 (we have an explicit return `fase` on line 2 when the numbers do not sum up to 47), irrespective of how many odd numbers it contains.