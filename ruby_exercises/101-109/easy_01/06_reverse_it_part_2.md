# 6. Reverse It (Part 2)

Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

Examples:

```ruby
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
```



```ruby
# compare to part 1, this problem reverse the order of the word character if the word is 5 or more characters in length
# split the input string into array of words
# iterate through array of words, for each word that is 5 or more character in length
#    reverse the word if its length is more than 5 characters
#    if less than 5 characteres, leave the word as is
# rejoin the array of words by white space
# method reverse can be used on string
def reverse_words(phrase)
  words = phrase.split
  converted_words = words.map do |word| 
    if word.size >= 5
       word.reverse
    else
      word
    end
  end
  converted_words.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
```

**LS Solution**

```ruby
def reverse_words(string)
  words = []
	
  # similar to my solution, except they destructively mutate the word when size is equal or greater than 5 and push the word into the array (I use map method)
  string.split.each do |word|
    word.reverse! if word.size >= 5
    words << word
  end

  words.join(' ')
end
```

