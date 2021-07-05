# 1. Sum of Sums

Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

Examples:

```ruby
sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35
```

**Solution**

```ruby
def sum_of_sums(arr)
  sub_total = 0
  total = 0

  arr.each do |num|
    sub_total += num
    total += sub_total
  end
  total
end
```

**LS Solution**

```ruby
def sum_of_sums(numbers)
  sum_total = 0
  # find the subset at variable size and accumulate the summ of subset
  1.upto(numbers.size) do |count|
    sum_total += numbers.slice(0, count).reduce(:+)
  end
  sum_total
end
```

`1.upto(numbers.size)` is used to generate the correct size for each subset of our `numbers` array. We use `number.slice(0, count)` to get that subset, and then `reduce(:+)` is used on the current subset to add up all its elements. Once we have computed the final sum(one that contains all numbers in our array), and added that to our total sum, then we are finished.

```ruby
def sum_of_sums(arr)
  arr.map.with_index {|_, index| arr[0..index].sum }.sum
end
```

