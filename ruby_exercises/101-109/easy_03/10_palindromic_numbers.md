# 10. Palindromic Numbers

Write a method that returns true if its  integer argument is palindromic, false otherwise. A palindromic number  reads the same forwards and backwards.

Examples:

```ruby
palindromic_number?(34543) == true
palindromic_number?(123210) == false
palindromic_number?(22) == true
palindromic_number?(5) == true
```

**Solution**

```ruby
def palindromic_number?(num)
    num = num.to_s
    num == num.reverse
end
```

#### Further Exploration

Suppose your number begins with one or more 0s. Will your method still work?  Why or why not?  Is there any way to address this?

Putting a zero in front of a number means that it is octal, and Ruby translates the number to decimal before you can  evaluate it. So, `013` *might* be a palindrome, because in decimal it is `11`.

When provided a  literal octal number as an argument, the method correctly determines whether its  decimal equivalent is a palindrome? If so, the answer is yes. However, it cannot determine the actual digits of a literal  octal number are a palindrome.

If the method is modified to take a number expressed as a string, the method can be made to determine if the string number is a palindrome even if it has leading zeros.