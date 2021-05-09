=begin
The maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence in an array of integers:

maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
-- should be 6: [4, -1, 2, 1]
Easy case is when the array is made up of only positive numbers and the maximum sum is the sum of the whole array. If the array is made of only negative numbers, return 0 instead.

Empty array is considered to have zero greatest sum. Note that the empty array is also a valid subarray.
=end

=begin
The maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence in an array of integers:

maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
-- should be 6: [4, -1, 2, 1]
Easy case is when the array is made up of only positive numbers and the maximum sum is the sum of the whole array. If the array is made of only negative numbers, return 0 instead.

Empty array is considered to have zero greatest sum. Note that the empty array is also a valid subarray.

P:
input: array of integers
output: integer
      - a maximum sum of a subarray from the input array

rules:
- contiguous means they are located consecutively
- input array can contain a mix of positive and negative integers


edge cases:
- return 0 if the input array is made of only negative numbers
- return 0 if the input array is empty
- return the sum of the whole array if the input array are all positive integers
- empty array is a valid input

examples:
[-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12 => [2, 1, 5, 4]
[-2], [-2, 1], [-2, 1, -7], etc

data:
integers
arrays
  - possibly find subarrays of different length for the input

algorithm:
1. check if all integers in input array 'arr' is negative
  - iterate through 'arr'
    - if all elememts is less than 0
      - return 0
2. if 'arr' is empty, return 0
3. check if all integers in 'arr' is positive
  - do similar process as in step 1, but check if elements are greater than 0
    - if so, return the sum of the whole array
    
    
4. find the subarrays of 'arr' (nested array)
  - initialize empty 'sub_arrs'
  - iterate through a range 0 through 'arr' size - 1
    - iterate through a range 1 through 'arr' size - current iteration from outer loop
      - retrieve elements in 'arr' from current iteration in the outer loop to the current iteration in the inner loop
      - append the result above to 'sub_arrs'
      
5. transform the elements 'sub_arrs' into its sum of each sub array and assign it to 'sum_sub_arrs'
6. find the largest value in 'sum_sub_arrs' and assign it to 'largest'
7. return 'largest'

=end

def max_sequence(arr)
  return 0 if arr.all? { |el| el < 0 }
  return arr.sum if arr.all? { |el| el > 0 }
  return 0 if arr.empty?
  
  sub_arrs = []
  (0...arr.size).each do |start_index|
    # p "start #{start_index}"
    (1..arr.size - start_index).each do |length|
      # p "length #{length}"
      sub_arrs << arr[start_index, length]
    end
  end
  sub_arrs.map do |sub_arr|
    sub_arr.sum
  end.max
end




p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12 

p max_sequence([]) == 0
p max_sequence([11]) == 11
p max_sequence([-32]) == 0

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12