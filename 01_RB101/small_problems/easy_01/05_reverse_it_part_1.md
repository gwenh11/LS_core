# 5. Reverse It (Part 1)

Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

Examples:

```ruby
puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
```

The tests above should print `true`.



**Solution**

```ruby
# split without an arugment will split string by white space
def reverse_sentence(words)
  words.split.reverse.join(' ')
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
```

