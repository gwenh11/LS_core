# 5. Uppercase Check

Write a method that takes a string argument, and returns `true` if all of the alphabetic characters inside the string are uppercase, `false` otherwise. Characters that are not alphabetic should be ignored.

Examples:

```ruby
uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == true
```

#### Further Exploration

Food for thought: in our examples, we show that `uppercase?` should return `true` if the argument is an empty string. Would it make sense to return `false` instead? Why or why not? **Should return false because empty string or non-letter strings aren't case sensitive**

```ruby
def uppercase?(str)
  alpha = /[a-zA-Z]/
  !str.match(alpha) ? false : str.upcase == str
end
```



**Solution**

```ruby
def uppercase?(str)
  str.chars.all? { |char| char == char.downcase.upcase }
end
```

**LS Solution**

```ruby
def uppercase?(string)
  string == string.upcase
end
```

