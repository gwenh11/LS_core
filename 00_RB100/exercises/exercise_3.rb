arr = [6, 7, 8, 9, 10]

new_arr = arr.select {|num| num.odd?}

p new_arr

another_arr = arr.select {|num| num % 2 != 0}