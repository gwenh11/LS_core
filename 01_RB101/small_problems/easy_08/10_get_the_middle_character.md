# 10. Get The Middle Character

Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.

Examples:

```ruby
center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'
```

**Solution**

```ruby
def center_of(str)
  quotient, remainder = str.size.divmod(2)
  half = quotient + remainder

  if str.size.even?
    str[half - 1] + str[half]
  else
    str[half - 1]
  end
end
# I didn't need to add the remainder
```

**LS Solution**

```ruby
def center_of(string)
  center_index = string.size / 2
  if string.size.odd?
    string[center_index]
  else
    string[center_index - 1, 2]
  end
end
```