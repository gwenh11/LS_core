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

Write a method that determines whether an array is palindromic; that is, the element values appear in the same sequence both forwards and backwards in the array. Now write a method that determines whether an array or a string is palindromic; that is, write a method that can take either an array or a string argument, and determines whether that argument is a palindrome. You may not use an `if`, `unless`, or `case` statement or modifier.

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

def palidrome?(str)
  check = []
  chars = str.split('')
  chars.each do |value_forward|
    chars.reverse_each do |value_backward|
      check << (value_backward == value_backward)
    end
  end

  check.all? { |check_value| check_value == true }
end
```

