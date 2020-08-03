words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

=begin
organize the anagrams into a hash with the key being the word alphabetically sorted, the value is an array containing all the words
1. iterate over the array
2. sort each word into alphatical order. Use .split('') to split the character. Use .sort to sort. Then, .join
2. if key exists, append current word into value (array)
3. otherwise, create a new key with this sorted word
=end

result = {}

words.each do |word|
  key = word.split('').sort.join
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

# On line 20, create an array as a value assigned to key 'key'
# that's why we can use .push on line 18. result[key] refers to an array.

# call block once for each key in result hash, passing the value as a parameter
result.each_value do |v|
  puts "--------"
  p v
end