# 4. Counting Up

Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

You may assume that the argument will always be a valid integer that is greater than 0.

Examples:

```ruby
sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]
```

#### Further Exploration

Food for thought: what do you think `sequence` should return if the argument is not greater than 0. For instance, what should you do if the argument is `-1`? Can you alter your method to handle this case? **return sequence backwards**

```ruby
def sequence(number)
  number >= 1 ? (1..number).to_a : (number..0).to_a
end
```

**Solution**

```ruby
def sequence(num)
  result = []
  1.upto(num) { |count| result << count} 
  result
end
```

**LS Solution**

```ruby
def sequence(number)
  (1..number).to_a
end
```

