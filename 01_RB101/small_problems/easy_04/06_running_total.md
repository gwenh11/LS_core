# 6. Running Totals

Write a method that takes an Array of  numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

Examples:

```ruby
running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []
```

#### Further Exploration

Try solving this problem using `Enumerable#each_with_object` or `Enumerable#inject` (note that `Enumerable` methods can be applied to Arrays).

```ruby
# can pass [] to inject
# nil.to_i is 0
def running_total(arr)
  arr.inject([]) { |arr, n| arr << (arr.last.to_i + n) }
end

def running_total(arr)
  arr.each_with_object([]) { |value, arr| arr << (value + arr.last.to_i)}
end
```



**Solution**

```ruby
def running_total(num_arr)
  total = 0
  num_arr.map do |num|
    total += num
  end
end
```

