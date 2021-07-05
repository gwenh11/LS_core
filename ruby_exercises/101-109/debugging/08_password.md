# 8. Password

The following code prompts the user to set their own password if they haven't done so already, and then prompts them to login with that password. However, the program throws an error. What is the problem and how can you fix it?

Once you get the program to run without error, does it behave as expected? Verify that you are able to log in with your new password.

```ruby
password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  password = new_password
end

def verify_password
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  set_password
end

verify_password
```

**Solution**

```ruby
example.rb:14:in `verify_password': undefined local variable or method `password' for main:Object (NameError)
```

`verify_password` method cannot access the variable `password` initialized on line 1. We can address this error by passing `password` as an argument to the `verify_password` method. 

Next, `set_password` is not updating password as expected, because `password` assignment inside the method does not impact the local variable `password`. This can be fixed by re-assigning `password` to the return value of `set_password` on line 22. Line 6 is redundant and can be removed. 

```ruby
password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  new_password
end

def verify_password(password)
  puts '** Login **'
  print 'Enter your password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  password = set_password
end

verify_password(password)
```

