# 7. Unlucky Days

Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

Examples:

```ruby
friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2
```

**Solution**

```ruby
def friday_13th(year)
  unlucky = 0
  1.upto(12) { |month| unlucky += 1 if Time.new(year, month, 13).friday? }
  unlucky
end
```

**LS Solution**

```ruby
require 'date'

def friday_13th(year)
  unlucky_count = 0
  thirteenth = Date.civil(year, 1, 13)
  12.times do
    unlucky_count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  unlucky_count
end
```

```ruby
require 'date'

def friday_13th(year)
  days = (1..12).map { |month| Date.new(year, month, 13) }
  days.count { |day| day.friday? }
end
```

#### Further Exploration

An interesting variation on this problem is to count the number months that have five Fridays. This one is harder than it sounds since you must account for leap years. **...skipping this one**

