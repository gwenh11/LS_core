# 4. Reverse Sentence

The `reverse_sentence` method should return a new string with the words of its argument in reverse order, without using any of Ruby's built-in `reverse` methods. However, the code below raises an error. Change it so that it behaves as expected.

```ruby
def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words = words[i] + reversed_words
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'
```

**Solution**

```ruby
def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    # reversed_words.prepend(words[i])
    # reverse_words.unshift(words[i])
    reversed_words = [words[i]] + reversed_words
    i += 1
  end

  reversed_words.join(' ')
end
```

On line 7, `words[i]` reference the string object in the `words` at index `i`. Here, we attempt to concatenate a string and an array together. Thus, it results in a `TypeError` 

Both `String` and `Array` have a `+` method ([String#+](https://ruby-doc.org/core/String.html#method-i-2B) and [Array#+](https://ruby-doc.org/core/Array.html#method-i-2B)). The former concatenates two strings, the latter concatenates two arrays. On line 7 we mix these two types: `words[i]` is a string and `reversed_words` is an array. Recall that `words[i] + reversed_words` is syntactic sugar for `words[i].+(reversed_words)`; we invoked [String#+](https://ruby-doc.org/core/String.html#method-i-2B) with an array as argument, causing a `TypeError` to be raised.