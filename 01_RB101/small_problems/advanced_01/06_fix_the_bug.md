# 6. Fix the Bug

The following code:

```ruby
def my_method(array)
  if array.empty?
    []
  elsif
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])
```

is expected to print:

```plaintext
[]
[21]
[9, 16]
[25, 36, 49]
```

However, it does not. Obviously, there is a bug. Find and fix the bug, then explain why the buggy program printed the results it did.

**Solution**

Original program actually prints

```
[]
nil
nil
nil
```

```ruby
def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end
```

In the original code, there was nothing after elsif. Therefore, the method invocation on array with a block is used as the conditional expression for elsif. The return value of this method call is always truthy. However, there is no code for this elsif branch, thus the return value is nil.