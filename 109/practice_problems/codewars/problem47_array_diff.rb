=begin
47. Array Diff
https://www.codewars.com/kata/523f5d21c841566fde000009/train/ruby

Your goal in this kata is to implement a difference function, which subtracts one list from another and returns the result.
It should remove all values from list a, which are present in list b.

array_diff([1,2],[1]) == [2]
If a value is present in b, all of its occurrences must be removed from the other:

array_diff([1,2],[1]) == [2]

P:
input: two array of integers - a, b
output: an array
        - contains the elements that are in a, but not in b
        
rules:
- 'b' array is shorter than 'a' array
- input arrays have some elements in common
- input array elements are integers and input can be empty
- elements in input array can be repeated, so need to return the same number of repeated elements
- return empty array if 'a' is an empty array

data:
integers
arrays

algorithm:
- check 'a' array
  - if 'a' is empty, return empty array
- initialize an empty array 'result'
- iterate through 'a' array
  - iterate through 'b' array
    - if element in 'a' is not in 'b'
      - append the element in 'a' to 'result'
- return 'result'



=end

def array_diff(a, b)
  return [] if a.empty?
  return a if b.empty?
  result = []
  
  a.each do |value_a|
    # p value_a
    b.each do |value_b|
      # p value_b
      result << value_a if value_a != value_b
    end
  end
  
  result
end

p array_diff([1,2], [1]) == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([], [1,2]) == []
