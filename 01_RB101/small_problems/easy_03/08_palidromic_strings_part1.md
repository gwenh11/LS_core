# 8. Palindromic Strings (Part 1)

Write a method that returns true if the  string passed as an argument is a palindrome, false otherwise. A  palindrome reads the same forward and backward. For this exercise, case  matters as does punctuation and spaces.

Examples:

```ruby
palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true
```

**Solution**

```ruby
def palindrome?(arg)
  arg == arg.reverse
end
```

**Further Exploration**

```ruby
def palindrome?(arg)
  reverse_index = -1
  check_sames = []

  arg.size.times do |index|
    check_sames << (arg[index] == arg[reverse_index])
    reverse_index -= 1
  end

  !check_sames.include?(false)
end
```

