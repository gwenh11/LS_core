# 10. The End Is Near But Not Here

Write a method that returns the next to last word in the String passed to it as an argument.

Words are any sequence of non-blank characters.

You may assume that the input String will always contain at least two words.

Examples:

```ruby
penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'
```

#### Further Exploration

Our solution ignored a couple of edge cases because we explicitly stated that you didn't have to handle them: strings that contain just one word, and strings that contain no words.

Suppose we need a method that retrieves the middle word of a phrase/sentence. What edge cases need to be considered? How would you handle those edge cases without ignoring them? Write a method that returns the middle word of a phrase or sentence. It should handle all of the edge cases you thought of.

```ruby
#-Edge cases:
#  -If a string contains no words it should return that empty string
#  -If a string contains just one word, it should return that word
#  -If a string contains an even amount of words, it should return the two middle words
# Assume special characters are allowed

def penultimate(str)
  temp_str = str.split
  length = temp_str.size
  half = length / 2
  
  if length == 0
    return "string is empty"
  elsif length > 0 && length < 3
    return "string is not long enough to find a middle word"
  elsif length.odd?
    "middle word is '#{temp_str[half]}'"
  elsif length.even?
    "string has an even length, two middle words are '#{temp_str[half - 1]}'  and '#{temp_str[half]}'"
  end
end
```

**Solution**

```ruby
def penultimate(str)
  str.split[-2]
end
```

