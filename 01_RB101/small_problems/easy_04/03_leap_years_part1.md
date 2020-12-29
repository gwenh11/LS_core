# 3. Leap Years (Part 1)

In the modern era under the Gregorian  Calendar, leap years occur in every year that is evenly divisible by 4,  unless the year is also divisible by 100. If the year is evenly  divisible by 100, then it is not a leap year unless the year is evenly  divisible by 400.

Assume this rule is good for any year greater than year 0. Write a  method that takes any year greater than 0 as input, and returns true if  the year is a leap year, or false if it is not a leap year.

```ruby
leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true
```

#### Further Exploration

The order in which you perform tests for a leap year calculation is important. For what years will `leap_year?`  fail if you rewrite it as:

```ruby
def leap_year?(year)
  if year % 100 == 0
    false
  elsif year % 400 == 0
    true
  else
    year % 4 == 0
  end
end
# test incorrectly evaluates year divisible by 400 as not leap year
```

Can you rewrite `leap_year?` to perform its  tests in the opposite order of the above solution?  That is, test  whether the year is divisible by 4 first, then, if necessary, test  whether it is divisible by 100, and finally, if necessary, test whether  it is divisible by 400. Is this solution simpler or more complex than  the original solution?

```ruby
def leap_year?(year)
  year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
end
```



**Solution**

```ruby
=begin 
problem: 
write a method that takes a integer as year, return true if it is a leap year and false otherwise.
explicit requirements:
  - leap year is defined as:
    - number that is divisible by 4 and not 100
    - number that is both divisible by 100 and 400

example: N/A

data structures:
input: integer
output: boolean

algorithm:
1. create a 'or' logic statement:
  left side: number divisible by 4 and not 100
  right side: number divisible by 100 and 400
=end

# remove divisible by 100 in the right side of 'or' statement, because divisble by 400 is inclusive of divisble by 100
def leap_year?(year)
  (year % 4 == 0 && year % 100 != 0) ||
  (year % 400 == 0)
end
```

**LS Solution**

```ruby
def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end
end
```

This solution takes this one step at a time by testing for the  least common cases first; years divisible by 400, and years divisible by 100. If the year is anything else, then it is a leap year if it  divisible by 4.