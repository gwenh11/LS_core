# 3. Lettercase Percentage Ratio

In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

Examples

```ruby
letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
```

#### Further Exploration

If we passed a string `'abcdefGHI'` as an argument to our method call the solution would be `{:lowercase=>66.66666666666666, :uppercase=>33.33333333333333, :neither=>0.0}`. It would be nicer if we could round these float numbers so that our solution looks like this `{:lowercase=>66.67, :uppercase=>33.33, :neither=>0.0}`. Try creating that solution on your own.

```ruby
def letter_percentages(str)
  result = { lowercase: 0, uppercase: 0, neither: 0}
  length = str.length
  str.chars.each do |char|
    case char
    when /[a-z]/ then result[:lowercase] += 1
    when /[A-Z]/ then result[:uppercase] += 1
    else              result[:neither] += 1
    end
  end
  
  result.each do |type, count|
    # format to two decimals begin here
    format_percentage = format('%.2f', (count.to_f / length) * 100)
    result[type] = format_percentage.to_f
  end
end
```



**Solution**

problem:
input: string
output: hash

  - lowercase percentage
  - uppercase percentage
  - neither percentage
rules:
- input string contains at least one character
- input string contains letters, numbers, special characters and blank space
- do we count blank spaces as neither? yes

data:
string
hash
array

algorithm:
- create a constant lowercase letter array 'a' to 'z'
- do the same thing for uppercase letters 
  - anything other letters are considered neither
- initialize a hash with 'lowercase', 'uppercase; and 'neither' as keys and values are 0
- split input string into arrays of characters
- iterate through array of characters
  - if the lowercase constant contain the character
    - increment the value of 'lowercase' in the hash by 1
  - if the uppercase constant contain the character
    -  increment the value of 'uppercase' in the hash by 1
  - otherwise, increment the value of 'neither' by 1
- find the size of the string and convert to a float
- iterate through the hash, transform the value by diving the value by the size and times 100
- return the new hash

```ruby
LOWERCASE = ('a'..'z').to_a
UPPERCASE = ('A'..'Z').to_a

def letter_percentages(str)
  hash = { lowercase: 0, uppercase: 0, neither: 0 }
  str.each_char do |char|
    if LOWERCASE.include?(char)
      hash[:lowercase] += 1
    elsif UPPERCASE.include?(char)
      hash[:uppercase] += 1
    else
      hash[:neither] += 1
    end
  end

  size = str.size.to_f
  hash.map do |key, value|
    [key, (value / size) * 100]
  end.to_h
end
```



```ruby
def letter_percentages(str)
  result = { lowercase: 0, uppercase: 0, neither: 0}
  length = str.length
  str.chars.each do |char|
    case char
    when /[a-z]/ then result[:lowercase] += 1
    when /[A-Z]/ then result[:uppercase] += 1
    else              result[:neither] += 1
    end
  end
  
  result.each do |type, count|
    result[type] = (count.to_f / length) * 100
  end
end
```

**LS Solution**

```ruby
def letter_percentages(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  percentages = { lowercase: [], uppercase: [], neither: [] }
  characters = string.chars
  length = string.length

  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }

  calculate(percentages, counts, length)

  percentages
end

def calculate(percentages, counts, length)
  percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
  percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
  percentages[:neither] = (counts[:neither] / length.to_f) * 100
end
```

**Remember, hashes are a bit complex. If you pass a hash into a method, and then alter a value in that hash, that altered value will then continue to persist even outside that method.**