# Does My List Include This?

Write a method named `include?` that takes an Array and a search value as arguments. This method should return `true` if the search value is in the array, `false` if it is not. You may not use the `Array#include?` method in your solution.

```ruby
include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false
```

**Solution**

```ruby
# Solution 1
def include?(arr, value)
  arr.any? { |current_value| current_value == value }
end

# Solution 2
def include?(arr, value)
  arr.each do |current_value|
    return true if current_value == value
  end
  false
end
```

**LS Solution**

```ruby
def include?(array, value)
  !!array.find_index(value)
end
```

**Other Solutions**

```ruby
def include?(array, value)
  array.any?(value)
end
```

#### Further Exploration

Can you think of other solutions to this problem? There are lots of different ways to get the same result.