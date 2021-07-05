# 7. Word to Digit

Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

Example:



```ruby
word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.''
```

#### Further Exploration

There are many ways to solve this problem and different varieties of it. Suppose, for instance, that we also want to replace uppercase and capitalized words.

Can you change your solution so that the spaces between consecutive numbers are removed? Suppose the string already contains two or more space separated numbers (not words); can you leave those spaces alone, while removing any spaces between numbers that you create?

What about dealing with phone numbers? Is there any easy way to format the result to account for phone numbers? For our purposes, assume that any 10 digit number is a phone number, and that the proper format should be `"(123) 456-7890"`.

```ruby
# Only get it to work when the phone numbers are altogether in one spot
DIGIT_HASH = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}.freeze

def word_to_digit(words)
  DIGIT_HASH.keys.each do |word|
    words.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
  end
  remove_space(words)
end

def remove_space(str)
  num_index = []
  num_arr = []
  str_arr = str.chars
  str_arr.each do |char|
    if DIGIT_HASH.values.include?(char)
      num_index << str_arr.index(char)
      num_arr << char
    end
  end

  replace_start = num_index.shift - 1
  replace_end = replace_start + 19
  format_num_arr = format_phone_number(num_arr)
  str_arr[0..replace_start].join + format_num_arr.join + str_arr[replace_end..-1].join
end

def format_phone_number(num_arr)
  ['('] + num_arr.slice(0, 3) + [')', ' '] + num_arr.slice(3, 3) + ['-'] + num_arr.slice(6, 4)
end

p word_to_digit('Please call me at three zero three eight six eight zero five two six. Thanks.')
```



**Solution**

```ruby
NUM_STRING = %w(zero one two three four five six seven eight nine)

PUNCTUATION = ['.', "?", "!", ",", ";", ":", "-", "[", "]", "{", "}", "(", ")", "'", "\"", "..."]

# check if word starts or ends with a punctuation
# however, this method only works if there is only one punctuation before or after the word to be converted
def word_to_digit(str)
  str.split.map do |word|
    if PUNCTUATION.include?(word[-1]) && NUM_STRING.include?(word[0..-2])
      NUM_STRING.index(word[0..-2]).to_s + word[-1]
    elsif PUNCTUATION.include?(word[0]) && NUM_STRING.include?(word[1..-1])
      word[0] + NUM_STRING.index(word[1..-1]).to_s
    elsif NUM_STRING.include?(word)
      NUM_STRING.index(word)
    else
      word
    end
  end.join(' ')
end
```

**LS Solution**

```ruby
DIGIT_HASH = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}.freeze

def word_to_digit(words)
  DIGIT_HASH.keys.each do |word|
    words.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
    #  We use \b to limit the operation to complete words, not substrings. For instance, if the phrase/sentence passed into the method has the word "freight" in it, we won't replace it. If we don't use \b, we would convert "freight" to "fr8".
  end
  words
end
```

```ruby
def word_to_digit(string)
  string_arr = string.split(" ")
  num_update = string_arr.map do |x|
  period = ""
  period = "." if x[-1] == "."
  x = x.delete_suffix(".") if x[-1] == "."
    case x.downcase
      when "one" then "1" << period
      when "two" then "2" << period
      when "three" then "3" << period
      when "four" then "4" << period
      when "five" then "5" << period
      when "six" then "6" << period
      when "seven" then "7" << period
      when "eight" then "8" << period
      when "nine" then "9" << period
      else x << period
    end
  end
  num_update.
```

```ruby
DIGITS = {
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9'
}
def word_to_digit(sentence)
  DIGITS.each { |k, v| sentence.gsub!(/\b#{k}\b/, v)}
  sentence
end
```

