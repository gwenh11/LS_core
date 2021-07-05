# 4. Swap Case

Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

You may not use `String#swapcase`; write your own version of this method.

Example:

```ruby
swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
```

**Solution**

```ruby
# didn't check for special characters
def swapcase(str)
  str.split.map do |sub_str|
    sub_str.chars.map do |char|
      if char == char.downcase.upcase
        char.downcase
      else
        char.upcase
      end
    end.join
  end.join(' ')
end
```

**LS Solution**

```ruby
def swapcase(string)
  characters = string.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  characters.join
end
```

