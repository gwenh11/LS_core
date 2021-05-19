# 3. Capitalize Words

Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

You may assume that words are any sequence of non-blank characters.

Examples

```ruby
word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
```

**Solution**

problem: 



Date:

input: string

output: string - capitalize every word



rules: input words are any sequence of non-blank characters



Algorithm:

\- split the string by blank space into an array of words

\- iterate through the array of words, capitalize the character at index 0

 \- mutate the array of word during chapitalization

\- return the array of words

```ruby
def word_cap(str)
  words = str.split
  words.each do |word|
    word.capitalize!
  end
  words.join(' ')
end
```

**LS Solution**

```ruby
def word_cap(words)
  words_array = words.split.map do |word|
    word.capitalize
  end
  words_array.join(' ')
end

def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end
```

#### Further Exploration

Ruby conveniently provides the `String#capitalize` method to capitalize strings. Without that method, how would you solve this problem? Try to come up with at least two solutions.

```ruby
def word_cap(words)
  words.split.map do |word|
    word[0].upcase + word[1..-1].downcase
  end.join(' ')
end

def word_cap(words)
  words.downcase.split.map { |word| word.tr(word[0], word[0].upcase) }.join(' ')
end

```



