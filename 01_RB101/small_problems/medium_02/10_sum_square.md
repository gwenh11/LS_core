# 10. Sum Square - Square Sum

Write a method that computes the difference between the square of the sum of the first `n` positive integers and the sum of the squares of the first `n` positive integers.

Examples:

```ruby
sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sum_square_difference(10) == 2640
sum_square_difference(1) == 0
sum_square_difference(100) == 25164150
```

**Solution**

```ruby
def sum_square_difference(num)
  square_sum(num) - sum_square(num)
end

def square_sum(num)
  ((1..num).inject(:+))**2
end

def sum_square(num)
  (1..num).inject { |sum, value| sum + value**2 }
end
```

