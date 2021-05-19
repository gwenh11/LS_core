# 2. Delete vowels

Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

Example:

```ruby
remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
```

**Solution**

```ruby
=begin
P:
input: array of string
output: array of string, but vowels are removed

rules:
- string contains uppercase and lowercase letters
- vowels are a, e, i, o, u
- case sensitivity and character orders are preserved

E:

D:
array
string

A:
- create a 'VOWELS' constant array to hold a, e, i, o, u strings
- intialize a 'temp' empty string
- intialize a 'result' empty array
- iterate through the input array
  - iterate through each character of the string element
    - conver the character to lower case. Unless the character is in 'VOWELS'
      - append it to 'temp'
  - end inner iteration
  - append 'temp' to 'result'
  - reintialize 'temp' to empty string to be used at the following outer iteration
- end outer iteration
- return 'result'
=end

VOWELS = %w(a e i o u)
def remove_vowels(arr)
  temp = ''
  result = []

  arr.each do |word|
    word.each_char do |char|
      unless VOWELS.include?(char.downcase)
        temp << char
      end
    end
    result << temp
    temp = ''
  end

  result
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
```



**LS Solution**

```ruby
def remove_vowels(strings)
  strings.map { |string| string.delete('aeiouAEIOU') }
end
```

**Other Student Solutions**

```ruby
def remove_vowels(arr)
  arr.map { |str| str.gsub(/[aeiou]/i, '') }
end
```

```ruby
def remove_vowels(strings)
  strings.map do |str|
    str.chars.reject { |char| %w(a e i o u).include?(char.downcase) }.join
  end
end
```

#### Further Exploration

Ruby has all sorts of String methods that could accomplish this task. How did you end up solving this exercise?