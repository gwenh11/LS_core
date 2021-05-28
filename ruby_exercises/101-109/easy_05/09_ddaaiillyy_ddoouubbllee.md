# 9. ddaaiillyy ddoouubbllee

Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

Examples:

```ruby
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''
```
**Solution**

```ruby
def crunch(str)
  result = ''
  return result if str.empty?
  result << str[0]
  1.upto(str.size - 1) do |index|
    if str[index] == str[index - 1]
      next
    else
      result << str[index]
    end
  end
  result
end
```

**LS Solution**

```ruby
def crunch(text)
  index = 0
  crunch_text = ''
  while index <= text.length - 1
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  crunch_text
end
```
**Further Exploration**

You may have noticed that we continue iterating until index points past the end of the string. As a result, on the last iteration `text[index]` is the last character in text, while `text[index + 1]` is `nil`. Why do we do this? What happens if we stop iterating when `index` is equal to `text.length`?

We need the last iteration `text[index]` at the last character in text, so that `text[index] == text[index + 1]` evaluates to `false` and the last character is appended to `crunch_text`. If we stop `index` at the next to last character, we would miss the last character in `crunch_text`. If we stop iterating when `index` is equal to `text.length`, `index` is out of bound. Therefore, both `text[index]` and `text[index + 1]` are `nil`. The expression `text[index] == text[index + 1]` evaluates to `true`. The code for the `unless` statement isn't executed. Ending iteration at `text.length` will not change the value of `crunched_string` comparing to ending iteration at `text.length - 1`.

Can you determine why we didn't use `String#each_char` or `String#chars` to iterate through the string? How would you update this method to use `String#each_char` or `String#chars`?

By using `String#each_char` or `String#chars` , we won't be able to reference the element after the current element during the iteration. Therefore, we can modify it by comparing the current element with the last element in `crunched_string`.

```ruby
def crunch(string)
  crunched_string = ''
  string.chars.each do |char|
    crunched_string << char unless char == crunched_string[-1]
  end
  crunched_string
end
```

You can solve this problem using regular expressions (see the Regexp class documentation). For a fun challenge, give this a try with regular expressions. If you haven't already read our book, Introduction to Regular Expressions, you may want to keep it handy if you try this challenge. (**skip since not a focus in RB101**)

Can you think of other solutions besides regular expressions?