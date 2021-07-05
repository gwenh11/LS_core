# Reverse an array without using the built-in reverse method.
p reverse_array([1, 2, 3, 4]) == [4, 3, 2, 1]
p reverse_array([1, 2, 3, 4, 5]) == [5, 4, 3, 2, 1]
p reverse_array!([1, 2, 3, 4, 5]) == [5, 4, 3, 2, 1] # mutating - just for fun
p reverse_array!([1, 2, 3, 4]) == [4, 3, 2, 1] # mutating - just for fun