# 7. Name Swapping

Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.

Examples

```ruby
swap_name('Joe Roberts') == 'Roberts, Joe'
```

**Solution**

```ruby
def swap_name(full_name)
  full_name.split(' ').reverse.join(', ')
end
```

