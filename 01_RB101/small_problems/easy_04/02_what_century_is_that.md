# 2. What Century is That?

Write a method that takes a year as input and returns the century.  The return value should be a string that  begins with the century number, and ends with `st`, `nd`, `rd`, or `th` as appropriate for that number.

New centuries begin in years that end with `01`. So, the years 1901-2000 comprise the [20th century](https://en.wikipedia.org/wiki/20th_century).

Examples:

```ruby
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'
```

**Solution**

```ruby
=begin 
- determine the century from year - divide year by 100
    if division is even, century is the quotient
    otherwise, century is the quotient plus 1
- determine oridnal ending
    if century ending in 1, ending is st, 2 - nd, 3 - rd
    th for other number
- convert century to string and add the ending
=end

def century(year)
  quotient = year / 100
  if year % 100 == 0
    century = quotient
  else
    century = quotient + 1
  end
  
  century_arr = century.digits
  if century_arr[0] == 1 && century_arr[1] != 1
    ending = 'st'
  elsif century_arr[0] == 2 && century_arr[1] != 1
    ending = 'nd'
  elsif century_arr[0] == 3 && century_arr[1] != 1
    ending = 'rd'
  else
    ending = 'th'
  end
  century.to_s + ending
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
```

**LS Solution**

```ruby
def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0
  century.to_s + century_suffix(century)
end

# I can practice using explicit return statement more like the one below
def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  
  last_digit = century % 10
  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end
```

