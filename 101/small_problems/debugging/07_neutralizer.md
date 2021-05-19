# 7. Neutralizer

We wrote a `neutralize` method that removes negative words from sentences. However, it fails to remove all of them. What exactly happens?

```ruby
def neutralize(sentence)
  words = sentence.split(' ')
  words.each do |word|
    words.delete(word) if negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.
```

**Solution**

```ruby
def neutralize(sentence)
  words = sentence.split(' ')
  # words.reject { |word| negative?(word) }.join(' ')
  # words.select { |word| !negative?(word) }.join(' ')
  words.reject! { |word| negative?(word) }
  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
#=> These cards are part of a board game.
```



A good way to see what is happening is to inspect `word` and `words` for each iteration of the block on lines 3-5. In the following example we decided to simply insert a few print statements. We also use [`Enumerable#each_with_index`](https://ruby-doc.org/core/Enumerable.html#method-i-each_with_index) instead of `each`, in order to see which index of the `words` array we are at.

```ruby
def neutralize(sentence)
  words = sentence.split(' ')
  words.each_with_index do |word, index|
    p index
    p word
    p words
    words.delete(word) if negative?(word)
    # delete method returns the deleted string
    p words
  end

  words.join(' ')
end
```

The output for the first three iterations looks like this:

```terminal
0
"These"
["These", "dull", "boring", "cards", "are", "part", "of", "a", "chaotic", "board", "game."]
["These", "dull", "boring", "cards", "are", "part", "of", "a", "chaotic", "board", "game."]
1
"dull"
["These", "dull", "boring", "cards", "are", "part", "of", "a", "chaotic", "board", "game."]
["These", "boring", "cards", "are", "part", "of", "a", "chaotic", "board", "game."]
2
"cards"
["These", "boring", "cards", "are", "part", "of", "a", "chaotic", "board", "game."]
["These", "boring", "cards", "are", "part", "of", "a", "chaotic", "board", "game."]
```

At index 0, nothing interesting happens. When the iteration is at index 1, the element is `"dull"`. Since it counts as negative, it is deleted from the array. As a consequence, each subsequent word is shifted one position to the left. In particular, the word that was previously at position 2, `"boring"`, is now at position 1. So in the next step, when the iteration is at index 2, it finds `"cards"`. Our mutation of the array caused it to skip `"boring"`.

**While iterating over an array, avoid mutating it from within the block. Instead you can use the Array methods [`select`](https://ruby-doc.org/core/Array.html#method-i-select) or [`reject`](https://ruby-doc.org/core/Array.html#method-i-reject)/[`reject!`](https://ruby-doc.org/core/Array.html#method-i-reject-21).**