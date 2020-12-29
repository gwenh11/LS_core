# 5. Squaring an Argument

Using the `multiply` method  from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a  number by itself).

Example:

```ruby
square(5) == 25
square(-8) == 64
```

#### Further Exploration

What if we wanted to generalize this method to a "power to the n"  type method: cubed, to the 4th power, to the 5th, etc.  How would we go  about doing so while still using the `multiply` method?

**Solution**

```ruby
def square(num)
    multiply(num, num)
end
```

The return value of `multiply` is the result of multiplying  the two arguments we pass to it, so we can simply pass in the same  number twice, which will return the squared value. Our `square` method is implicitly returning the return value from `multiply(n, n)`.

**Further Exploration**

```ruby
def multiply(num1, num2)
  num1 * num2
end

def power(num, exponent)
  return 1 if exponent == 0
  product = 1
  exponent.times do
    product = multiply(product, num)
  end
  product
end

p power(5, 3)
p power(5, 2)
p power(5, 0)
p power(5, 1)
```

