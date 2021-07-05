# 1. Repeat Yourself

Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

Example:

```ruby
repeat('Hello', 3)
```

Output:

```terminal
Hello
Hello
Hello
```



**Solution**

```ruby
# Use the Integer#times method
# The block doesn't need parameter since it isn't used in the block evaluation.
def repeat(words, num_times)
	num_times.times {|_| puts words}
end

# Use String concatenation 
def repeat(words, num_times)
    if num_times > 0
        puts (words + "\n") * num_times
    end
end
```

