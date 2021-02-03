# 6. Staggered Caps (Part 2)

Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter. The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

Example:

```ruby
staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
```

#### Further Exploration

Modify this method so the caller can determine whether non-alphabetic characters should be counted when determining the upper/lowercase state. That is, you want a method that can perform the same actions that this method does, or operates like the previous version.

Hint: Use a keyword argument.

```ruby
def staggered_case_without_nonalpharic(str)
  need_upper = false
  str.chars.map.with_index do |char, index|
    if char =~ /[A-Za-z]/ #/[a-z]/i
      need_upper = !need_upper
      if need_upper
        char.upcase
      else
        char.downcase
      end
    else
      char
    end
  end.join
end

def staggered_case_with_nonalpharic(str)
  str.chars.map.with_index do |char, index|
    if index.even?
      char.upcase
    else
      char.downcase
    end
  end.join
end

def staggered_case(str, count_nonalpharic = 'yes')
  count_nonalpharic == 'yes' ? need_nonalpharic = true : need_nonalpharic = false
  
  if need_nonalpharic
    staggered_case_with_nonalpharic(str)
  else
    staggered_case_without_nonalpharic(str)
  end
end
```



**Solution**

```ruby
def staggered_case(str)
  need_upper = false

  str.chars.map.with_index do |char, index|
    if char =~ /[A-Za-z]/ #/[a-z]/i
      need_upper = !need_upper
      if need_upper
        char.upcase
      else
        char.downcase
      end
    else
      char
    end
  end.join
end
```

**LS Solution**

```ruby
def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if char =~ /[a-z]/i
      if need_upper
        result += char.upcase
      else
        result += char.downcase
      end
      need_upper = !need_upper
    else
      result += char
    end
  end
  result
end
```

This solution is very similar to the previous solution; the only difference is that we need to avoid changing `need_upper` when processing non-alphabetic characters. We use a simple regular expression with the `/i` flag (ignore case) to detect letters.