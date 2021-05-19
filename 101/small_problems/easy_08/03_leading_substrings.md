# 3. Leading Substrings

Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

Examples:

```ruby
leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
```

**Solution**

```ruby
def leading_substrings(str)
  str.chars.map.with_index { |_, index| str[0..index]}
end
```

**LS Solution**

```ruby
def leading_substrings(string)
  result = []
  # can use #times here
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end
```

