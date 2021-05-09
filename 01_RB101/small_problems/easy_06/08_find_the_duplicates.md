# Find the Duplicate

Given an unordered array and the information that exactly one value in the array occurs twice (every other value occurs exactly once), how would you determine which value occurs twice? Write a method that will find and return the duplicate value that is known to be in the array.

Examples:

```ruby
find_dup([1, 5, 3, 1]) == 1
find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
```

**Solution**

```ruby
=begin
**Problem**

Input: array of integers
Output: a integer that is duplicate

Questions: N/A
- what error message to give when input arrays have more than one duplicate integers or input array contains different data types?

Rules (Explicit/Implicit):
- duplicate means the number appears more than once in the array
- exactly only one integer that is duplicate in the input
- integers in input array aren't in any particular order
- input arrays only contain integers (based on test cases)

Edge Cases: N/A


**Examples**
[1, 5, 3, 1] => 1 - 1 occurs more than once
[18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) => 73 - 73 occurs more than once


**Data Structure**
integers
arrays

**Algorithm**
- create a array of unique integers and assign it to 'unique_inputs'
  - unique means it only occurs once
- iterate through 'unqiue_inputs'
  - count the occurence of the current elements in input array
  - if occurence is equal or greater than 2, return the current element

=end

def find_dup(arr)
  unique_inputs = arr.uniq
  unique_inputs.each do |num|
    return num if arr.count(num) >= 2
  end
end
```

**LS Solution**

```ruby
def find_dup(array)
  array.find { |element| array.count(element) == 2 }
end
```

**Other Solutions**

```ruby
def find_dup(array)
  # need method pop at the end to return the element. After method uniq, it's still an array.
  array.select {|e| array.count(e) > 1}.uniq.pop
end
```

```ruby
def find_dup(array)
  dup_check = []
  array.each do |element|
    return element if dup_check.include?(element)
    dup_check << element 
  end
end
```

#### Further Exploration

There are several ways to go about solving this problem. One other way would be to have a separate array that keeps track of which items have been looked at as we iterate through the original array. If we ever add the same item twice to this second array, then we know that we have found a duplicate.

How did you end up solving this one?