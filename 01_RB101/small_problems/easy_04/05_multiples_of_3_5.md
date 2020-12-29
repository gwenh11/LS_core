# 5. Multiples of 3 and 5

Write a method that searches for all  multiples of 3 or 5 that lie between 1 and some other number, and then  computes the sum of those multiples. For instance, if the supplied  number is `20`, the result should be `98` (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

You may assume that the number passed in is an integer greater than 1.

Examples

```ruby
multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168
```

#### Further Exploration

Investigate `Enumerable.inject` (also known as `Enumerable.reduce`), How might this method be useful in solving this problem?  (Note that `Enumerable` methods are available when working with Arrays.) Try writing such a solution.  Which is clearer? Which is more succinct?

```ruby
def multisum(num)
  (1..num).inject(0) do |sum, value|
    if value % 3 == 0 || value % 5 == 0
      sum + value
    else
      sum
    end
  end
end
```



**Solution**

```ruby
def multisum(num)
  multi_arr = []
  1.upto(num) do |value|
    if value % 3 == 0 || value % 5 == 0
      multi_arr << value
    end
  end
  multi_arr.sum
end
```

```ruby
def multisum(int)
  (1..int).select {|num| (num % 3 == 0 || num % 5 == 0)}.inject(:+)
end
```

