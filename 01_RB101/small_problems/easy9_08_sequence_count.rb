=begin
Sequence Count
Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create. The method should return an Array that contains the same number of elements as the count argument, while the values of each element will be multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. If the count is 0, an empty list should be returned.

Problem:
- create a method that takes two integers
  - first num is count of elements in return array
  - second num is the starting num in return array
- return array 
  - each element is the multiples of second num

Examples:
sequence(5, 1) == [1, 2, 3, 4, 5]  => [1*1, 1*2, 1*3, 1*4, 1*5]
sequence(4, -7) == [-7, -14, -21, -28] => [-7*1, -7*2, -7*3, -7*4]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == [] 
Assume first num valid - equal to 0 or greater

Data:
input - two integers
output - array

Algorithm:
- initialize result array empty
- intialize counter 1
- create a loop while first num is less or equal to result array size
  - append second num * counter to result array
  - increase counter by 1
=end

def sequence(arr_size, start_num)
  result = []
  counter = 1
  # have to use '<' because when loop will execute when result.size == arr.size
  # therefore, result array will have more elements than arr_size
  while result.size < arr_size
    result << start_num * counter
    counter += 1
  end
  result
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
