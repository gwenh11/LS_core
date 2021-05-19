# 9. String Assignment

Take a look at the following code:

```ruby
name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name
```

What does this code print out? Think about it for a moment before continuing.

If you said that code printed

```ruby
Alice
Bob
```

you are 100% correct, and the answer should come as no surprise. Now, let's look at something a bit different:

```ruby
name = 'Bob'
save_name = name
name.upcase!
puts name, save_name
```

What does this print out? Can you explain these results?

**Solution**

```ruby
# Output
BOB
BOB
```

On line 1, `name` variable is assigned the string object value `'Bob'`. On line 2, `save_name` is assigned the same reference as `name`. On line 3, method `#upcase!` called on `name` mutates the object that `name` points to, from `'Bob'` to `'BOB'`.  Therefore, the value that `save_name` references also changes. Both `name` and `save_name` are set equal to `'BOB'`. On line 4, method `#puts` output the values of `name` and `save_name` to the screen on separate lines. 