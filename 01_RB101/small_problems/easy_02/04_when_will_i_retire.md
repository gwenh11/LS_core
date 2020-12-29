# 4. When will I Retire?

Build a program that displays when the user will retire and how many years she has to work till retirement.

Example:

```plaintext
What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!
```

**Solution**

Use `Time#now` to get the current time and `Time#year` to get the current year.

```ruby
puts "What is your age?"
current_age = gets.chomp.to_i

puts "At what age would like to retire?"
retire_age = gets.chomp.to_i

current_year = Time.now.year
working_years = retire_age - current_age
retire_year = current_year + working_years

puts "It's #{current_year}. You will retire in #{retire_year}." + "\n" +
     "You have only #{working_years} years of work to go!"
```

