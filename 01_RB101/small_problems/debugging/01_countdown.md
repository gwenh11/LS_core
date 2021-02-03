# 1. Countdown

Our countdown to launch isn't behaving as expected. Why? Change the code so that our program successfully counts down from 10 to 1.

```ruby
def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  decrease(counter)
end

puts 'LAUNCH!'
```

#### Further Exploration

We specify `10` two times, which looks a bit redundant. It should be possible to specify it only once. Can you refactor the code accordingly?

```ruby
10.downto(0) { |counter| puts counter }
puts 'LAUNCH'
```



**Solution**

```ruby
def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'
```

`counter` parameter of the `decrease` method is only local to the method and not related to the `counter` variable referenced on line 5, 8 and 9. The return value of the method `decrease` is not used anywhere, so the `counter` variable outside of the method continues to reference the integer `10`.

To address this, we can reassign the variable `counter` on line 9 to the return value of `decrease` method.