# 8. Double Char (Part 2)

Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

Examples:

```ruby
double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""
```

**Solution**

```ruby
VOWELS_LOWERCASE = ['a', 'e', 'i', 'o', 'u']
CONSONANTS_LOWERCASE = ('a'..'z').to_a - VOWELS_LOWERCASE

def double_consonants(str)
  str.chars.map do |char|
    CONSONANTS_LOWERCASE.include?(char.downcase) ? char * 2 : char
  end.join
end
```

**LS Solution**

```ruby
CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  result = ''
  string.each_char do |char|
    result << char
    result << char if CONSONANTS.include?(char.downcase)
  end
  result
end
```

