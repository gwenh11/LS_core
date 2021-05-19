# 4. Matching Parentheses?

Write a method that takes a string as argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching `'('` and `')'` pairs.

Examples:

```ruby
balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false
```

Note that balanced pairs must each start with a `(`, not a `)`.

**Solution** 

```ruby
def balanced?(str)
  parantheses = str.chars.select do |char|
    char == '(' || char == ')'
  end

  if parantheses.empty?
    true
  elsif str.count('(') == str.count(')') && parantheses.first == '(' &&
        parantheses.last == ')'
    true
  else
    false
  end
end
```

**LS Solution**

```ruby
def balanced?(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0
  end

  parens.zero?
end
```

#### Further Exploration

There are a few other characters that should be matching as well. Square brackets and curly brackets normally come in pairs. Quotation marks(single and double) also typically come in pairs and should be balanced. Can you expand this method to take into account those characters?

```ruby
def balanced?(string)
  square_brac = 0
  curly_brac = 0
  parens = 0
  string.each_char do |char|
    square_brac += 1 if char == '['
    square_brac -= 1 if char == ']'
    curly_brac += 1 if char == '{'
    curly_brac -= 1 if char == '}'
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0 || square_brac < 0 || curly_brac < 0
  end
  parens.zero? && square_brac.zero? && curly_brac.zero? && 
  string.count("'").even? && string.count("\"").even?
end
```



