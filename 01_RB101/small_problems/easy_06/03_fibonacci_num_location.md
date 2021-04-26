# Fibonacci Number Location By Length

The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers are 1 by definition, and each subsequent number is the sum of the two previous numbers. This series appears throughout the natural world.

Computationally, the Fibonacci series is a very simple series, but the results grow at an incredibly rapid rate. For example, the 100th Fibonacci number is 354,224,848,179,261,915,075 -- that's enormous, especially considering that it takes 6 iterations before it generates the first 2 digit number.

Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

Examples:

```ruby
find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847
```

You may assume that the argument is always greater than or equal to 2.

#### Further Exploration

Fibonacci numbers are sometimes used in demonstrations of how to write recursive methods. Had we tried to use a recursive method, it probably would have resulted in the program running out of stack space. Ruby isn't well equipped to deal with the level of recursion required for a recursive solution.

We'll explore Fibonacci numbers again, along with the usual recursive solutions, later in the Medium exercises.

**Solution**

```ruby
=begin
P:
input: integer - number of digits in Fibonacci number
output: integer - index in the series of Fibonacci numbers so that this is the first number whose digits are the same as the input integer

rules:
- Fibonacci series is a series of numbers such that the first 2 numbers are 1, and each subsequenet number is the sum of the previous numbers

E:

D:
array
integer

A:
- initialize empty array 'fib_series' to hold the Fibonacci numbers
- intialize 'previous_num' to 1
- intialize 'current_num' to 1
- append 'previous_num1' to 'fib_series'
- append 'current_num' to 'fib_series'
- create a loop
  - reassign 'current_num' to 'previous_num' adding 'current_num'
  - reassign 'previous_num' to the last element in 'fib_series'
  - append 'current_num' to 'fib_series'
  - the last value of the 'fib_series' has a size that matches the integer argument when converted to string
- return the size of the array, which is also the position of the fibonacci number
=end

def find_fibonacci_index_by_length(digit)
  fib_series = []
  previous_num = 1
  current_num = 1
  fib_series << previous_num
  fib_series << current_num

  loop do
    current_num += previous_num
    previous_num = fib_series[-1]
    fib_series << current_num
    break if current_num.to_s.size == digit
  end

  fib_series.size
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
```

**LS Solution**

```ruby
def find_fibonacci_index_by_length(number_digits)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.size >= number_digits

    first = second
    second = fibonacci
  end

  index
end
```

