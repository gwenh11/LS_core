# 4. Multiplying Two Numbers

Create a method that takes two arguments, multiplies them together, and returns the result.

Example:

```ruby
multiply(5, 3) == 15
```

**Solution**

```ruby
def multiply(num1, num2)
    num1 * num2
end
```

#### Further Exploration

For fun: what happens if the first argument is an `Array`? What do you think is happening here?

If the first argument is a string, it returns a new string by concatenating the second argument number copies of the first argument string. It behaves similarly if the first argument is an array.

```ruby
multiply([1, 2], 3)
#=> [1, 2, 1, 2, 1, 2]
```

Note:

ary * str     → new_string

repetition with a string argument, equivalent to `array.join(str)`

```ruby
[1, 2, 3] * ","
#=> "1,2,3"
```

