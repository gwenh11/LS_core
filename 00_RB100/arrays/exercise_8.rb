arr = [1, 2, 3, 4]

new_arr = arr.map {|num| num * 2}

p arr
p new_arr

=begin
arr = [1, 2, 3, 4, 5]
new_arr = []

arr.each do |n|
  new_arr << n + 2
end

p arr
p new_arr
=end