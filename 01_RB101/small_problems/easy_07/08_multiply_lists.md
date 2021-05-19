# 8. Multiply Lists

Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

Examples:

```ruby
multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
```

**Solution**

```ruby
def multiply_list(arr1, arr2)
  combine = arr1.zip(arr2)
  combine.map do |sub_arr|
    sub_arr.inject(1, :*)
  end
end
```

**LS Solution**

```ruby
def multiply_list(list_1, list_2)
  products = []
  list_1.each_with_index do |item, index|
    products << item * list_2[index]
  end
  products
end
```

#### Further Exploration

The `Array#zip` method can be used to produce an extremely compact solution to this method. Read the documentation for `zip`, and see if you can come up with a one line solution (not counting the `def` and `end` lines).

```ruby
def multiply_list(arr1, arr2)
    arr1.zip(arr2).map { |sub_arr| sub_arr.inject(1, :*)}
end
```

