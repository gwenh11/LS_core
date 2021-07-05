# Write a method that takes two numbers. Return an array containing all primes between the two numbers (include the two given numbers in your answer if they are prime). Don't use Ruby's 'prime' class.
p find_primes(3, 10) == [3, 5, 7]
p find_primes(11, 20) == [11, 13, 17, 19]
p find_primes(100, 101) == [101]
p find_primes(1, 100) == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
p find_primes(1, 2) == [2]

# Write a method that will determine whether an integer is a prime. Do not use the Prime class.
p is_prime?(3) == true
p is_prime?(4) == false

# Write a method that will take an array of methods and only return those that are prime. 
p select_primes([1, 2, 3, 4]) == [2, 3]
p select_primes([4, 6, 8, 10])

# Write a method that will take an array of numbers and return the number of primes in the array.
p count_primes([1, 2, 3, 4]) == 2
p count_primes([4, 6, 8, 10]) == 0

# Write a program that asks the user to enter an integer greater than zero, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

# Write a method that combines two Arrays passed in as arguments and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation. 
# You may assume that both input Arrays are non-empty and that they have the same number of elements.
p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, "a", 2, "b", 3, "c"]
