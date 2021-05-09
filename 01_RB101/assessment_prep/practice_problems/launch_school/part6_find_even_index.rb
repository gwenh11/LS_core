=begin
You are going to be given an array of integers. Your job is to take an array and find an index N where the sum of the integers to the left of N is equal to the sum of integers to the right of N. If there is no index, that would make this happen, return -1

For example:

Let's say you are given the array [1, 2, 3, 4, 3, 2, 1]
Your method will return the index 3, because at the 3rd position of the array, the sum of left side of the index [1, 2, 3] and the sum of the right side of the index [3, 2, 1] both equal 6.

Another one:
You are given the array [20, 10, -80, 10, 10, 15, 35]
At index 0 the left side is []
The right side is [10, -80, 10, 10, 15, 35]
The both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
Index 0 is the place where the left side and right side are equal.
=end

p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3

=begin
You are going to be given an array of integers. Your job is to take an array and find an index N where the sum of the integers to the left of N is equal to the sum of integers to the right of N. If there is no index, that would make this happen, return -1

For example:

Let's say you are given the array [1, 2, 3, 4, 3, 2, 1]
Your method will return the index 3, because at the 3rd position of the array, the sum of left side of the index [1, 2, 3] and the sum of the right side of the index [3, 2, 1] both equal 6.

Another one:
You are given the array [20, 10, -80, 10, 10, 15, 35]
At index 0 the left side is []
The right side is [10, -80, 10, 10, 15, 35]
The both are equal to 0 when added. (Empty arrays are equal to 0 in this problem)
Index 0 is the place where the left side and right side are equal.

P:
input: 'arr' an array of integers (positive or negative)
output: integer 
      - index
      - sum of left side of the index = sum of right side of the index

rules:
- input array doesn't need to have symetry

edge cases:
- return -1 if no index can be found
- do I need to include a condition where sum is 0 when there is an empty array?
  - at the first index, left array sum is 0
  - at the last index, right array sum is 0

examples:

data:
integers
arrays
  - subarrays

algorithm:
0. intialize 'last_index' to 'arr' size -1
1. iterate through 'arr' and passing in 'index', find the left side and right side based on the current 'index'
  - if 'index' is 0,
    - assign 'left_side' to empty array
    - assign 'right_side' to elements in 'arr' from 'index' + 1 to -1
  - if 'index' is 'last_index'
    - assign 'left_side' to element from 0 to 'last_index' - 1
    - assign 'right_side' to empty array
  - otherwise,
    - assign 'left_side' to elements from 0 to 'index - 1'
    - assign 'right_side' to elements from 'index' + 1 to -1
  - if the sum of the left side is equal to the sum of the right side, return the 'index'

- return -1
=end

def find_even_index(arr)
  last_index = arr.size - 1
  arr.each_index do |index|
    if index == 0
      left_side = []
      right_side = arr[(index + 1)..-1]
    elsif index == last_index
      left_side = arr[0..(last_index - 1)]
      right_side = []
    else
      left_side = arr[0..(index - 1)]
      right_side = arr[(index + 1)..-1]
    end
    return index if left_side.sum == right_side.sum
  end
  
  -1
end


# p find_even_index([1, 2, 3, 4, 3, 2, 1]) #== 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3


p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([1, 2, 3, 4, 5, 6]) == -1