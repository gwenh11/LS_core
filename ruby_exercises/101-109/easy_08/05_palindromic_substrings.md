# 5. Palindromic Substrings

Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

You may (and should) use the `substrings` method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay attention to case; that is, `"AbcbA"` is a palindrome, but neither `"Abcba"` nor `"Abc-bA"` are. In addition, assume that single characters are not palindromes.

Examples:

```ruby
palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
```

**Solution**

```ruby
def substrings(str)
  result = []
  str.size.times do |count|
    temp = str[count..-1]
    result << temp.chars.map.with_index { |_, index| temp[0..index]}
  end
  result.flatten
end

def palindromes(str)
  substrings = substrings(str)
  substrings.select { |sub| sub == sub.reverse && sub.size > 1 }
end
```

**LS Solution**

```ruby
def palindromes(string)
  all_substrings = substrings(string)
  results = []
  all_substrings.each do |substring|
    results << substring if palindrome?(substring)
  end
  results
end

def palindrome?(string)
  string == string.reverse && string.size > 1
end
```

Again, this problem is much easier if you use the method from the previous exercise. Building this method from scratch is sure to leave you with an aching head.

We'll use a helper method here, `palindrome?`, to test whether any given string is a palindrome. Note that we need to verify the size of the string as well as its reversibility.

The main method just calls `substrings` from the previous exercise, and then constructs a list of all of the return values that are palindromic.

#### Further Exploration

Can you modify this method (and/or its predecessors) to ignore non-alphanumeric characters and case? Alphanumeric characters are alphabetic characters(upper and lowercase) and digits.

```ruby
def palindromes(str)
  str.gsub!(/[^a-zA-Z0-9]/, '') # remove non-alphanumerics
  substrings = substrings(str)
  substrings.select { |sub| sub == sub.reverse && sub.size > 1 }
end
```

