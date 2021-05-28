# 6. fizzbuzz

Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

Example:

```ruby
fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
```

**Solution**

```ruby
def fizzbuzz(start_num, end_num)
  result = []
  (start_num..end_num).each do |num|
    result << fizzbuzz_value(num)
  end
  puts result.join(', ')
end



def fizzbuzz_value(num)
  if num % 3 == 0 && num % 5 == 0
    'FizzBuzz'
  elsif num % 5 == 0
    'Buzz'
  elsif num % 3 == 0
    'Fizz'
  else
    num
  end
end
```

