# 1. Combine Two Lists

Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the same number of elements.

Example:

```ruby
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
```

**Solution**

problem: write a method 'interleave' that takes two arguments and return an array



Data:

input: 2 arrays that can be of different types

output: 1 array that has both input arrays with the elements taken in alteration

​    (element from the first array start first)

assume both input arrays are of same length



algorithm:

\- initialize result array

\- iterate through the first array, for each iteration:

 \- push element from the first array to result

 \- do the same thing using the second array

```ruby
def interleave(arr1, arr2)
  result = []
  arr1.each_index do |index|
    result << arr1[index]
    result << arr2[index]
  end
  result
end
```

**LS Solution**

```ruby
def interleave(array1, array2)
  result = []
  array1.each_with_index do |element, index|
    result << element << array2[index]
  end
  result
end
```

#### Further Exploration

Take a few minutes to read about `Array#zip`. `#zip` doesn't do the same thing as `interleave`, but it is very close, and more flexible. In fact, `interleave` can be implemented in terms of `zip` and one other method from the `Array` class. See if you can rewrite `interleave` to use `zip`.

```ruby
def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end
```


