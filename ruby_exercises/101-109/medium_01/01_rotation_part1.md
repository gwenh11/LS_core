# 1. Rotation (Part 1)

Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

Do not use the method `Array#rotate` or `Array#rotate!` for your implementation.

Example:

```ruby
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true
```

#### Further Exploration

Write a method that rotates a string instead of an array. Do the same thing for integers. You may use `rotate_array` from inside your new method.

```ruby
def rotate_str(str)
  rotate_array(str.chars).join
end

def rotate_integer(integer)
  rotate_array(integer.to_s.chars).join.to_i
end
```

**Solution**

```ruby
def rotate_array(arr)
  temp = arr.dup
  temp.shift
  temp.append(arr.first)
end
```

**LS Solution**

```ruby
def rotate_array(array)
  array[1..-1] + [array[0]]
end
```

