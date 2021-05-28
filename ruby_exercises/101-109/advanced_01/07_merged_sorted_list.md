# 7. Merge Sorted Lists

Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments in sorted order.

You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.

Your solution should not mutate the input arrays.

Examples:

```ruby
merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
merge([], [1, 4, 5]) == [1, 4, 5]
merge([1, 4, 5], []) == [1, 4, 5]
```

**Solution**

```ruby
def merge(arr1, arr2)
  result = []
  tally = {}
  merge = arr1 + arr2

  # build a hash with keys as unique elements in merge array and values as the count of each element in merge array
  merge.each { |value| tally[value] = merge.count(value) }
  # sort all the keys
  keys = tally.keys.sort

  # iterate through keys array, retrieve the value of the key in tally and append the key to result array as many times as the value indicates
  keys.each do |key|
    tally[key].times do 
      result << key
    end
  end
  result
end
```

**LS Solution**

```ruby
# this solution only works if each array is already sorted
def merge(array1, array2)
  index2 = 0
  result = []

  array1.each do |value|
    # kinda like iterate through array2
    while index2 < array2.size && array2[index2] <= value
      result << array2[index2]
      index2 += 1
    end
    result << value
  end

  result.concat(array2[index2..-1])
end
```

**The obvious solution is to walk through both arrays simultaneously, keeping track of where you are in each array with appropriate indexes**. We'll modify this a tiny bit by using `Array#each` to iterate through the `array`, and use an index to track our location in the `array2`.

With each iteration of `array1`, we copy all elements from `array2` that are less than or equal to the `array1` value, incrementing our index as needed. Note that we need to be careful to not try copying any values from `array2` that aren't there. After copying these elements, we then append the current value from `array1`, and start the next iteration.