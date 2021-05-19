# 2. Lettercase Counter

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

Examples

```ruby
letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
```

**Solution**

problem: 



Date:

input: string

output: hash that has three entries

 \- first pair: key 'lowercase', value is number of lowercase letters

 \- second pair: key 'uppercase', value is number of uppercase letters

 \- third pair: key 'neither', value is number characters that are neither



rules: do count blank space



Algorithm:

\- initizlie result hash which has three keys and value as 0

\- need constant array of lower case and upper case 

\- iterate through each characters of the string, compare each character with the constant and increase the count value by one if found

```ruby
LOWERCASE = ('a'..'z').to_a
UPPERCASE = ('A'..'Z').to_a

def letter_case_count(str)
  h = { lowercase: 0, uppercase: 0, neither: 0}
  str.each_char do |char|
    if LOWERCASE.include?(char)
      h[:lowercase] += 1
    elsif UPPERCASE.include?(char)
      h[:uppercase] += 1
    else
      h[:neither] += 1
    end
  end
  h
end
```

**LS Solution**

```ruby
def letter_case_count(string)
  counts = {}
  characters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
  counts
end
```

We take a different approach in our second solution. We first initialize an empty `counts` hash and then use `Array#count` to find the number of occurrences of lowercase, uppercase, and all other characters. In the block following the `count` method invocation, we use the `String#=~` method to match each character of the string against a pattern specified by a regular expression. The block will return a truthy value if there is a match, `nil` otherwise.

In the second solution, we use regular expressions to count certain types of characters. We'll explain things a bit here for those who aren't familiar with regex:

`char =~ /[a-z]/` : This checks if the character is a lowercase letter between a and z. `char =~ /[A-Z]/` : This checks if the character is an uppercase letter between A and Z. `char =~ /[^A-Za-z]/` : This checks if the character is neither an uppercase letter nor a lowercase letter.