# 7. Odd Lists

Write a method that returns an Array that contains every other element of an `Array` that is passed in as an argument. The values in the returned list  should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

Examples:

```ruby
oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []
```

**Solution**

```ruby
def oddities(arr)
  result = []
  arr.each_index do |index|
    if index % 2 == 0
      result << arr[index]
    end
  end
  result
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

# method that returns the 2nd, 4th, 6th, and so on elements of an array.
def evens(arr)
  arr.select.with_index do |_,index|
    index.odd?
  end
end

# we can use #index because the arary elements are unique. Otherwise, it returns the first index when the value matches (from left to right).
def evens1(arr)
    arr.select { |value| arr.index(value).odd? }
end

def evens2(arr)
    arr.reject { |value| arr.index(value).even? }
```

#### Further Exploration

Write a companion method that returns the 2nd, 4th, 6th, and so on elements of an array.

Try to solve this exercise in at least 2 additional ways.

