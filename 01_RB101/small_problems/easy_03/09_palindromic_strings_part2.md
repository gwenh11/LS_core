# 9. Palindromic Strings (Part 2)

Write another method that returns true if the string passed as an argument is a palindrome, false otherwise.   This time, however, your method should be case-insensitive, and it  should ignore all non-alphanumeric characters.  If you wish, you may  simplify things by calling the `palindrome?` method you wrote in the previous exercise.

Examples:

```ruby
real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false
```

### Further Exploration

Read the documentation for `String#delete`, and the closely related `String#count` (you need to read `count` to get all of the information you need for `delete`.)

**Solution**

```ruby
# implicit requirement - ignore space between characters/words
def real_palindrome?(string)
    string = string.downcase.delete('^a-z0-9')
    string == string.reverse
end
```

`String#delete` and `String#count` use the same rules for building the set of characters as arguments.

The backslash character can be used to escape ^ or -, if it is placed before them. ^ and - are ignored. 

```ruby
"hello^world".count "\\^aeiou" #=> 4
"hello-world".count "a\\-eo"   #=> 4
```

