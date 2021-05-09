=begin
You have to create a method that takes a positive integer number and return the next bigger number formed by the same digits:

12 => 21
513 => 531
2017 => 2071

If no bigger number can be composed using those digits, return -1
9 => -1
111 => -1
531 => -1
=end

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798

=begin
You have to create a method that takes a positive integer number and return the next bigger number formed by the same digits:

12 => 21
513 => 531
2017 => 2071

If no bigger number can be composed using those digits, return -1
9 => -1
111 => -1
531 => -1

P:
input: one positive integer
output: another integer
        - next bigger number than the input
        - formed by the same digits as the input
rules:
- input are only positive integers

edge case:
- return -1, when no bigger number can be formed based on the following:
    - if all digits are the same
    - if input has a length of less than 2
    - if all digits are sorted from greatest to least
  

example:
2017
2107
2170
2701
2710
0217
0271
7201
7210

data:
integers
array of digits

algorithm:
- convert the input to array of digits and assign it to 'digits'
- guard clause when no number can be composed
  - check if all digits are the same
    - retrieve the first elements in 'digits'
    - count this element in 'digits'
    - if the count is same as the 'digits' size, then all digits are the same
  - check the size of digits to see if less than 2
  - sort the 'digits' in decending order and assign it to 'sorted_digits'
    - if 'digits' and 'sorted_digits' are the same, reutrn -1

- find different permutation of 'digits' and assign it to 'permutation' array (nested array)
- sort 'permutation' in ascending order and assign it to 'sorted_permutation'
- iterate through 'sorted_permutation'
  - if the element is greater than the input integer
    - return the element

=end



def next_bigger_num(num)
  digits = num.digits
  sorted_digits = digits.sort { |a, b| b <=> a }
  if digits.count(digits[0]) == digits.size || digits.size < 2 || sorted_digits == digits.reverse
    return -1
  end
  
  permutation = digits.permutation.to_a.map do |sub_arr|
    sub_arr.join('').to_i
  end
  
  sorted_permutation = permutation.sort
  
  sorted_permutation.each do |current_num|
    return current_num if current_num > num
  end
end

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123456789) == 123456798


given the parameters (h, bounce, window)

num_of_bounces = (Math.log(window) - Math.log(h)) % Math.log(bounce)

num_of_passes = (num_of_bounces * 2) + 1