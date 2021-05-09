=begin
You are given an array that contains only integers (positive and negative). Your job is to sum only the numbers that are the same and consecutive. The result should be one array.

You can assume there is never an empty array and there will always be an integer.
=end
=begin
**Problem**

Input: array of integers
Output: a new array 
    - each element is the sum of numbers that are the same and consecutive

Questions:


Rules (Explicit/Implicit):
- input can be positive and negative numbers
- consecutive means they locate next to each other

Edge Cases:
 N/A

**Examples**
[1,4,4,4,0,4,3,3,1,1]
 1   12  0 4  6   2
 
[1,1,7,7,3]
  2   14 3

[-5,-5,7,7,12,0]
  -10   14 12 0

**Data Structure**
integer
array

**Algorithm**
- slice the input array into groups so that the same and consecutive values are grouped together and assign this to 'groups'
- iterate through 'groups', transform each element to the sum of the sub-array
=end
  
def sum_consecutives(arr)
  groups = arr.slice_when { |a, b| a != b }.to_a
  groups.map { |sub_arr| sub_arr.sum }
end

p sum_consecutives([1,4,4,4,0,4,3,3,1,1]) == [1,12,0,4,6,2]
p sum_consecutives([1,1,7,7,3]) == [2,14,3]
p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]