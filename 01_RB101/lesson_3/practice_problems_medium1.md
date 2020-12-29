# Practice Problems: Medium 1

#### Question 1

Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in the days before computers had video screens).

For this practice problem, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:

```ruby
The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!
```

Solution 1

```ruby
10.times {|num| puts (" " * num) + "The Flintstones Rock!"}
```



------

#### Question 2

The result of the following statement will be an error:

```ruby
puts "the value of 40 + 2 is " + (40 + 2)
```

Why is this and what are two possible ways to fix this?

Solution 2

The error is string and integers are being concatenated together. Two possible ways to fix are calling `to_s` on `(40+2)` and using string interpolation.

```ruby
puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{40 + 2}"
```



------

#### Question 3

Alan wrote the following method, which was intended to show all of the factors of the input number:

Copy Code

```ruby
def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end
```

Alyssa noticed that this will fail if the input is `0`, or a negative number, and asked Alan to change the loop. How can you make this work without using `begin`/`end`/`until`? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

#### Bonus 1

What is the purpose of the `number % divisor == 0` ?

#### Bonus 2

What is the purpose of the second-to-last line (`line 8`) in the method (the `factors` before the method's `end`)?

Solution 3

```ruby
def factors(numbers)
    divisor = number
    factors = []
    while divisor > 0
        factors << number / divisor if number % divisor == 0
        divisor -= 1
    end
    factors
end
```

Bonus 1

A factor is a number that divides into another number exactly without leaving a remainder (an integer). The purpose of the `number % divisor == 0` is to determine if the result of the division is an integer. 

Bonus 2

The purpose of the second-to-last line is the return value from the method. If omitted, the return value would be `nil` (the action is exiting the loop)

Without an explicit `return` statement in the code, the return value of the method is the last statement executed. 

------

#### Question 4

Alyssa was asked to write an implementation of a rolling buffer. Elements are added to the rolling buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements in the buffer.

She wrote two implementations saying, "Take your pick. Do you like `<<` or `+` for modifying the buffer?". Is there a difference between the two, other than what operator she chose to use to add an element to the buffer?

Copy Code

```ruby
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end
```

Solution 4

In the first example, the input argument `buffer` is mutated and will end up of being changed after the `rolling_buffer1` returns. Once the call returns, the input array is different. 

In the second example, the input argument isn't altered. 

------

#### Question 5

Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator. A user passes in two numbers, and the calculator will keep computing the sequence until some limit is reached.

Ben coded up this implementation but complained that as soon as he ran it, he got an error. Something about the limit variable. What's wrong with the code?

```ruby
limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
```

How would you fix this so that it works?

Solution 5

The problem is `limit` is not visible in the scope of `fib`. The solution is to include `limit` as an additional argument. 



------

#### Question 6

What is the output of the following code?

```ruby
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
```

Solution 6

the return value of `mess with it` is assigned to `new_answer` and `answer` isn't changed. The output is `34`.

------

#### Question 7

One day Spot was playing with the Munster family's home computer and he wrote a small program to mess with their demographic data:

Copy Code

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end
```

After writing this method, he typed the following...and before Grandpa could stop him, he hit the Enter key with his tail:

```ruby
mess_with_demographics(munsters)
```

Did the family's data get ransacked? Why or why not?

Solution 7

The family's data did get ransacked.

When `munster` is passed to `mess_with_demographics`, `object_id` of `munster` is passed to `demo_hash` of the method. `munster` and `demo_hash` point to the same hash object. When `values` is called on `demo_hash`, it returns a new array populated with the values from `demo_hash` (elements of the array has the same `object_id` as the hash values). This array contains hashes. `each` is called on this array and iterates through each hash of the array, the reference of each hash is passed to block parameter `family_member`. The values for key `age` and `gender` are reassigned changing the hash objects. Therefore, `demo_hash` and `munsters` are both modified.  

------

#### Question 8

Method calls can take expressions as arguments. Suppose we define a method called `rps` as follows, which follows the classic rules of rock-paper-scissors game, but with a slight twist that it declares whatever hand was used in the tie as the result of that tie.

Copy Code

```ruby
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end
```

What is the result of the following call?

Copy Code

```ruby
puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
```

Solution 8

Evaluate from the innermost to the outermost expressions.

```ruby
puts rps(rps("paper", "rock"), "rock")
puts rps("paper, rock")
#=> "paper"
```



------

#### Question 9

Consider these two simple methods:

```ruby
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
```

What would be the return value of the following method invocation?

```ruby
bar(foo)
```

Solution 9

The reference of return value of `foo`(`yes`) is passed to `bar` when `bar` is invoked. Local variable `param` of `bar` also points to `yes`. Per conditional, the return value is `no`.