# 4. Letter Swap
Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces

Examples:

```ruby
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'
```

**Solution**


- split string into an array of substrings
- create a loop to iterate through the substrings array 
  - for each substring, iterate through the characters and transform:
    - assign the last character to character index 0
    - assign the first character to character index -1
- return the new string

```ruby
def swap(str)
  words = str.split
  word_counter = 0
  char_counter = 0
  current_word = ''
  result_words = []
  result_chars = []
  while word_counter < words.size
    current_word = words[word_counter]
    current_chars = current_word.chars
    while char_counter < current_chars.size
      if char_counter == 0
        result_chars << current_chars[-1]
      elsif char_counter == current_chars.size - 1
        result_chars << current_chars[0]
      else
        result_chars << current_chars[char_counter]
      end
      char_counter += 1
    end
    result_words << result_chars.join
    result_chars = []
    char_counter = 0
    word_counter += 1
  end
  result_words.join(' ')
end
```

**LS Solution**

```ruby
def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end
```

The tricky part here is actually swapping the first and last characters of each word. Because of the mild trickiness, we use a separate method. It uses this common idiom:

```ruby
a, b = b, a
```

to exchange the values of a and b. In our method, a is the first letter of the word, and b is the last letter of the word. When Ruby sees something like this, it effectively **creates a temporary array with the values from the right side ([b, a]),** and then assigns each element from that array into the corresponding named variable:

```ruby
a = b   # b is value from position 0 of temporary array (original value of b)
b = a   # a is value from position 1 of temporary array (original value of a)
```

Looked at another way, this is equivalent to:

```ruby
temporary = [b, a]
a = temporary[0]
b = temporary[1]
```

**Further Exploration**

How come our solution passes word into the swap_first_last_characters method invocation instead of just passing the characters that needed to be swapped? Suppose we had this implementation:

```ruby
def swap_first_last_characters(a, b)
  a, b = b, a
end
```

and called the method like this:

```ruby
swap_first_last_characters(word[0], word[-1])
```

It doesn't work, because `swap_first_last_characters` only returns two characters and not the whole word.