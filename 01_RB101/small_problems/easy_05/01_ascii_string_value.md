# 1. ASCII String Value
Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)

```ruby
ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0
```

**Further Exploration**

There is an Integer method such that:

```ruby
char.ord.mystery == char
```
where mystery is our mystery method. Can you determine what method name should be used in place of mystery? What happens if you try this with a longer string instead of a single character?

```ruby
char.ord.chr == char
```
With longer strings, `#ord` only converts the first character and ignore the rest of the string. Thus, this code wont' work with strings that have more than one character.

**Solution**
```ruby
def ascii_value(string)
  string.chars.inject(0) { |sum, char| sum + char.ord} 
end
```