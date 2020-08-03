arr= ["a","b", "c", "d"]

arr.each_with_index {|value, index| puts "#{index + 1}. #{value}"}