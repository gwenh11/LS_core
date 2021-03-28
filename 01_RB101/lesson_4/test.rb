# arr1 = ["a", "b", "c"]
# arr2 = arr1.dup
# puts "arr1 #{arr1.object_id}"
# puts "arr2 #{arr2.object_id}"
# arr1.each {|el| puts "#{el} is #{el.object_id}"}
# arr2.each {|el| puts "#{el} is #{el.object_id}"}
# arr2.map! do |char|
#   char.upcase
# end
# arr2.each {|el| puts "arr2 #{el} is #{el.object_id}"}
# arr1 # => ["a", "b", "c"]
# arr2 # => ["A", "B", "C"]


n = 10

2.times do |n|
  p n
  n = 11
end

# puts n