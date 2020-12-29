# 5. Greeting a user

Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

#### Further Exploration

Try modifying our solution to use `String#chomp!` and `String#chop!`, respectively.

Examples

```plaintext
What is your name? Bob
Hello Bob.
```



```plaintext
What is your name? Bob!
HELLO BOB. WHY ARE WE SCREAMING?
```

**Solution**

```ruby
puts "What is your name?"
name = gets.chomp

# can use name[-1] == '!' instead of include method
if name.include?('!')
  # can use name.chop to remove the last character
  name = name.delete('!').upcase
  puts "HELLO #{name}. WHY ARE WE SCREAMING?"
else
  name = name.capitalize
  puts "Hello #{name}."
end
```

**Solution uses `String#chomp!` and `String#chop!`**

```ruby
puts "What is your name?"
name = gets
name.chomp!

if name[-1] == '!'
  puts "HELLO #{name.chop!.upcase!}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name.capitalize!}."
end
```

