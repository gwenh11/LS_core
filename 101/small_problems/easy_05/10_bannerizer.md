# 10. Bannerizer

Write a method that will take a short line of text, and print it within a box.

Example:

```ruby
print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+
```

```ruby
print_in_box('')
+--+
|  |
|  |
|  |
+--+
```

**Solution**

```ruby
def print_in_box(str)
  horizontal_line = '+' + '-' * (str.size + 2) + '+'
  padding_line = '|' + ' ' * (str.size + 2) + '|'
  str_line = '| ' + str + ' |'
  
  puts horizontal_line, padding_line
  puts str_line
  puts padding_line, horizontal_line
end
```

**Further Exploration**

Modify this method so it will truncate the message if it will be too wide to fit inside a standard terminal window (80 columns, including the sides of the box). For a real challenge, try word wrapping very long messages so they appear on multiple lines, but still within a box.

```ruby
SCREEN_WIDTH = 80
MAX_TEXT_WIDTH = SCREEN_WIDTH - 2

def print_in_box(str)
  phrases = []
  if str.size < MAX_TEXT_WIDTH
    phrases = [str]
    horizontal_line = '+' + '-' * (str.size + 2) + '+'
    padding_line = '|' + ' ' * (str.size + 2) + '|'
  else
    horizontal_line = '+' + '-' * (SCREEN_WIDTH) + '+'
    padding_line = '|' + ' ' * (SCREEN_WIDTH) + '|'

    while str.size > MAX_TEXT_WIDTH
      phrases << str.slice!(0, MAX_TEXT_WIDTH)
    end
  end
  
  puts horizontal_line, padding_line
  phrases.each { |phrase| puts '| ' + phrase + ' |' }
  puts padding_line, horizontal_line
end
```

