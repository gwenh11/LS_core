# Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.

=begin
p:
input: array of positive integers and another integer
output: integer 
      - length of a subarrat that meets the requirement

questions:
-contiguous?
- minimal length? - smallest length?

rules:
- input are all positive integers
- 0 is considered a positive integer
- return 0 if there isn't one

example:
[2, 3, 1, 2, 4, 3]
4 + 3 = 7
subarray is [4, 3] length of 2
- need to find sum of subarrays of different lengths (from 1 to the whole array)

[2], [2, 3], [2, 3, 1], [2, 3, 1, 2], [2, 3, 1, 2, 4], [2, 3, 1, 2, 4, 3]
[3], [3, 1], [3, 1, 2], [3, 1, 2, 4], etc


[1, 11, 100, 1, 0, 200, 3, 2, 1, 250]
[100, 1, 0, 200] length of 4

algorithm:
1. find all the subarrays from the input array and assign it to 'sub_arr'
  - initialize 'sub_arr' to empty array
  - iterate through a range 0 to input array size - 1 - curent iteration is used as starting index
    - iterate through 1 to array size - starting index
      - reference the elements in the input from current starting index and the current length - result will be an array
      - append the result array to 'sub_array'
2. sort the 'sub_arr' by its element length (shortest to longest)
3. iterate through 'sub_arr':
  - find the sum of the subarray
  - if the sum is equal or greater than second argument - integer
  - return the length of the current subarray
4. return the lenght of the subarray

=end

def find_sub(arr)
  sub_arrs = []
  (0...arr.size).each do |start_index|
    (1..arr.size - start_index). each do |length|
    sub_arrs << arr[start_index, length]
    end
  end
  sub_arrs
end


def minSubLength(arr, size)
  sub_arrs = find_sub(arr)
  sorted_sub_arrs = sub_arrs.sort_by { |sub_arr| sub_arr.length }
  sorted_sub_arrs.each do |sub_arr|
    return sub_arr.size if sub_arr.sum >= size
  end
  0
end

def minSubLength(arr, size)
  sub_arrs = []
  
  (0...arr.size).each do |start_index|
    (1..arr.size - start_index).each do |length|
      sub_array = arr[start_index, length] 
    sub_arrs << sub_array if sub_array.sum >= size
    end
  end
  sub_arrs.empty? ? 0 : sub_arrs.map {|sub| sub.length}.min
end

p minSubLength([2,3,1,2,4,3], 7) == 2
p minSubLength([1, 10, 5, 2, 7], 9) == 1
p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0