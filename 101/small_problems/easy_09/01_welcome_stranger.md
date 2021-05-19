# 1. Welcome Stranger

Create a method that takes 2 arguments, an array and a hash. The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. The hash will contain two keys, `:title` and `:occupation`, and the appropriate values. Your method should return a greeting that uses the person's full name, and mentions the person's title and occupation.

Example:

```ruby
greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=> Hello, John Q Doe! Nice to have a Master Plumber around.
```

#### Further Exploration

This method doesn't actually pass rubocop! What is the best way to shorten the lines in this method so it doesn't exceed the 80 maximum characters to a line?

```ruby
def greetings(name_arr, job_hash)
  name = name_arr.join(' ')
  job = "#{job_hash[:title]} #{job_hash[:occupation]}"
  "Hello, #{name}! Nice to have a #{job} around."
end

def greetings(arr, hsh)
  full_name = arr.join(' ')
  job = hsh.values.join(' ')

  puts("Hello, #{full_name}! Nice to have a #{job} around.")
end
```



**Solution**

```ruby
def greetings(name_arr, job_hash)
  puts "Hello, #{name_arr.join(' ')}! Nice to have a #{job_hash[:title]} #{job_hash[:occupation]} around."
end
```

