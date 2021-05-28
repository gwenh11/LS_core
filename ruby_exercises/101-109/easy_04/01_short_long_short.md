# 1. Short Long Short

Write a method that takes two strings as  arguments, determines the longest of the two strings, and then returns  the result of concatenating the shorter string, the longer string, and  the shorter string once again. You may assume that the strings are of  different lengths.

Examples:

```ruby
short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"
```

**Solution**

```ruby
def short_long_short (str1, str2)
  short = ''
  long = ''
  if str1.size > str2.size
    short, long = [str1, str2]
  else 
    short, long = [str2, str1]
  end
  short + long + short
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
```

```ruby
def short_long_short(string1, string2)
  arr = [string1, string2].sort_by { |el| el.length }
  arr.first + arr.last + arr.first
end
```

