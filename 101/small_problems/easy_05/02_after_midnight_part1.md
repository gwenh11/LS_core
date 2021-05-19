# 2. After Midnight (Part 1)
The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

You may not use ruby's Date and Time classes.

Examples:

```ruby
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"
```

**Solution**

need the remainder for minutes and hours. 
if the input is less than 0, the hours are 24 minus the calculated hours. Same with minutes.
if the input is greater than 0, calculated hours and mins are as is

```ruby
# long way cause I didn't understand the behavior of modulo
def time_of_day(input)
  minutes, rem_minutes = input.abs.divmod(60)
  rem_hours = minutes % 24

  if input < 0
    if rem_minutes != 0
      rem_minutes = 60 - rem_minutes
      rem_hours = 23 - rem_hours
    else
      rem_hours = 24 - rem_hours
    end
  end

  format('%02d', rem_hours.to_s) + ':' + format('%02d', rem_minutes.to_s)
end
```

**LS Solution**

```ruby
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day(delta_minutes)
  delta_minutes =  delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
  # "#{'%02d' % hours}:#{'%02d' % minutes}"
end
```

- Ensure the time difference is in the range of 0...MINUTES_PER_DAY by using the % operator (it computes the remainder of dividing the left side by the right side)
- Use divmod to break the time difference down into hours and minutes
- Format the results with Kernel#format. Each %02d produces a two-digit number with leading zeros as needed.

**Further Exploration**

How would you approach this problem if you were allowed to use ruby's Date and Time classes? Suppose you also needed to consider the day of week? (Assume that delta_minutes is the number of minutes before or after midnight between Saturday and Sunday; in such a method, a delta_minutes value of -4231 would need to produce a return value of Thursday 01:29.)

```ruby
def time_of_day(delta_minutes)
  time = Time.new(2020, 12, 20) + delta_minutes * MINUTES_PER_HOUR
  time.strftime('%A %H:%M')
end
```

