# Reversed Arrays (Part 2)

Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.

You may not use `Array#reverse` or `Array#reverse!`, nor may you use the method you wrote in the previous exercise.

Examples:

```ruby
reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
list.object_id != new_list.object_id  # => true
list == [1, 3, 2]                     # => true
new_list == [2, 3, 1]                 # => true
```

#### Further Exploration

An even shorter solution is possible by using either `inject` or `each_with_object`. Just for fun, read about these methods in the `Enumerable` module documentation, and try using one in your `reverse` method.

```ruby
def reverse(arr)
  arr.each_with_object([]) do |value, memo|
    memo.prepend(value)
  end
end

def reverse(arr)
  arr.inject([]) { |memo, value| memo.unshift(value) }
end
```



**Solution**

```ruby
def reverse(arr)
  reverse_arr = []
  (arr.size - 1).downto(0) do |index|
    reverse_arr << arr[index]
  end

  reverse_arr
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true
```

**LS Solution**

```ruby
def reverse(array)
  result_array = []
  array.reverse_each { |element| result_array << element }
  result_array
end
```

**Student Solution**

```ruby
def reverse!(list)
  list.reverse_each.with_object([]) { |el, arr| arr << el }
end
```

```ruby
def reverse(ary)
  ary.sort {|left, right| ary.index(right) <=> ary.index(left) }
end
```

