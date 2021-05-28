# 8. Array Average

Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array. The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.

Examples:

```ruby
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
```

The tests above should print `true`.

**Solution**

```ruby
=begin
Problem:
Write a method that takes an array of positive integers and returns the average of all numbers in the array.
Explicit rules: 
  - array will never be empty
  - numbers are positive integers 
Implicit rules:
  - average value is also an integer

Example:
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

Data Structures:
Input: array (of positive integers)
Output: integer

Algorithm:
Observation: need to find the sum of all elements and divide by the number of elements (array size)

1. Initalize sum to 0
2. Iterate through the array, sum = sum + element value
3. Average = sum / array size

Code:
=end

def average(arr)
  sum = 0
  arr.each {|num| sum += num}
  sum / arr.size
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
```

**LS Solution**: I need to review `#reduce` method

```ruby
# reduce with a symbol
def average(numbers)
    numbers.reduce(:+).fdiv(numbers.size)
end

# reduce with a block
def average(numbers)
    sum = numbers.reduce { |sum, number| sum + number}
    sum.fdiv(numbers.count)
end
```

`Integer#fdiv(numeric)` returns a floating point result of dividing integer by numeric. This is part of the further exploration. 

#### Further Exploration

Currently, the return value of `average` is an `Integer`. When dividing numbers, sometimes the quotient isn't a whole number, therefore, it might make more sense to return a `Float`. Can you change the return value of `average` from an `Integer` to a `Float`?