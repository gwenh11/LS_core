# 11. Group Anagrams

Given the array...

```ruby
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
```

Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order. Your output should look something like this:

```ruby
["demo", "dome", "mode"]
["neon", "none"]
#(etc)
```

**Solution**

```ruby
=begin
input: array of strings (words)
output: nested arrays
  - groups of that are anagrams

rules:
- anagrams are words that have the same letters but in different order

data:
arrays
strings

algorithm:
- transfrom each element in the input into its alphabeticall sorted word
- find the unique words and call it 'uniq_words'
- create an empty array 'anam_groups' to hold groups of anagrams
- create an empty array 'anam' to hold one group of anagrams
- iterate through 'uniq_words'
  - iterate through input array
    - sort the current input element alphabetically
    - if it is the same as the current 'uniq_words'
      - append the current input element into 'anam'
    - end the inner iteration
    - append the current value of 'anam' to 'anam_groups'
	- reintialize 'amam' to empty array
  - end outer iteration
- output each value of the hash
=end

def group_anagrams(arr)
  uniq_words = arr.map { |word| word.chars.sort.join }.uniq
  anam_groups = []
  anam = []
  uniq_words.each do |sorted_word|
    arr.each do |word|
      if sorted_word == word.chars.sort.join
        anam << word
      end
    end
    anam_groups << anam
    anam = []
  end
  anam_groups.each { |anam| p anam }
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

p group_anagrams(words)

```

**LS Solution**

```ruby
result = {}

words.each do |word|
  key = word.split('').sort.join
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each_value do |v|
  puts "------"
  p v
end
```

