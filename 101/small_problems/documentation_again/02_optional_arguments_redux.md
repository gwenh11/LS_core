# 2. Optional Arguments Redux

Assume you have the following code:

```ruby
require 'date'
# adding Date from the standard library API so it can be used within the program
# civil is a class method
# method new can be used in place of method civil
puts Date.civil #=> -4712-01-01 
puts Date.civil(2016) #=> 2016-01-01 
puts Date.civil(2016, 5) #=> 2016-05-01
puts Date.civil(2016, 5, 13) #=> 2016-05-13
```

What will each of the 4 `puts` statements print? see above

from `::civil` docs:

`civil([year=-4712[, month=1[, mday=1[, start=Date::ITALY]]]]) → date`

Outermost bracket pairs can only be omitted if all innermost bracket pairs are omitted as well. In other words, arguments must be passed from general to the specific. Hence, if you omit the `month` argument, you must omit `mday` and `start`, but you must supply `year`.

On line 5, no arguments are passed to method invocation. `year` defaults to `-4712`, `month` defaults to `01`, `mday` defaults to `01`, and `start` defaults to `Date::ITALY` 

One line 6, `year` value is passed as an argument, `month` defaults to `01`, `mday` defaults to `01`, and `start` defaults to `Date::ITALY` 

On line 7, `year` and `month` values are passed as arguments, `mday` defaults to `01`, and `start` defaults to `Date::ITALY` 

On line 8, `year`, `month` and `mday` values are passed as arguments, `start` defaults to `Date::ITALY`