=begin
You have to create a method that takes a positive integer number and return the next bigger number formed by the same digits:

12 => 21
513 => 513
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