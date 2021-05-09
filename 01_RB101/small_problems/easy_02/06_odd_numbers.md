# 6. Odd Numbers

Print all odd numbers from `1` to `99`, inclusive, to the console, with each number on a separate line.

**Solution**

```ruby
(1..99).each { |num| puts num if num.odd? }
```

**LS Solution**

This solution use basic while loop

```ruby
value = 1
while value <= 99
  puts value
  value += 2
end
```

#### Further Exploration

Repeat this exercise with a technique different from the one you just used, and different from the solution shown above. You may want to explore the use `Integer#upto` or `Array#select` methods, or maybe use `Integer#odd?`

```ruby
# Use Integer#upto
1.upto(99) { |num| puts num if num.odd? }

# Use Array#select
odd_arr = (1..99).to_a.select { |num| num.odd? }
puts odd_arr
```

