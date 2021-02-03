# 2. HEY YOU!

[String#upcase!](https://ruby-doc.org/core/String.html#method-i-upcase-21) is a destructive method, so why does this code print `HEY you` instead of `HEY YOU`? Modify the code so that it produces the expected output.

```ruby
def shout_out_to(name)
  name.chars.each { |c| c.upcase! }

  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'
```

**Solution**

```ruby
def shout_out_to(name)
    puts 'HEY ' + name.upcase
end
# Or
def shout_out_to(name)
  puts 'HEY ' + name.upcase!
end
```

`name.chars` returns an array of characters in the string `name` `['y', 'o', 'u']`, which is different from the `name` string. It is this array that is mutated on line 2. Therefore, `name` is still `you` on line 4.