# 1. Cute angles

Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

Examples:

=begin
Note: your results may differ slightly depending on how you round values, but should be within a second or two of the results shown.

You should use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07".

You may use this constant to represent the degree symbol:

```ruby
DEGREE = "\xC2\xB0"
```

Problem: write a method that takes a float number and returns a string 
  - float number is an angle between 0 and 360
  - result string is an angle in degrees, minutes and seconds, plus the symbols
  
Example:
N/A

Algorithm:
- find the total seconds - input * 3600
- find the quotient and the remainder from dividing the total seconds by 60. Quotient is the minutes, the remainder is the seconds
- Do the same thing but using the previous quotient. The quotient is the degrees, the remainder is the minutes
- Convert the degrees, minutes and seconds to string and add the string symbols to get final string format


=end

DEGREES_TO_SECONDS = 3600
DEGREE = "\xC2\xB0"

def dms(input)
  total_seconds = input * DEGREES_TO_SECONDS
  total_minutes, seconds = total_seconds.divmod(60)
  degrees, minutes = total_minutes.divmod(60)
  format("%02d%s%02d'%02d\"", degrees, DEGREE, minutes, seconds)
  
end

def degree_string_ar(degree)
  degree_ar = degree.to_s.split('')
  split_index = degree_ar.find_index('.')

  degree_ar[0] = degree_ar.slice(0..split_index).join
  unless split_index == nil
  degree_ar[1] = '0' + degree_ar.slice(split_index..-1).join
  else
  degree_ar[1] = nil
  end

#   degree_ar
# end

# def dms(degree)
#   end_str = ''
#   end_str += sprintf("%i\xC2\xB0", degree_string_ar(degree)[0].to_i)
#   if degree_string_ar(degree)[1] != nil
#     degree = degree_string_ar(degree)[1].to_f * 60
#     end_str += sprintf("%02i'", degree_string_ar(degree)[0].to_i)
#     if degree_string_ar(degree)[1] != nil
#       degree = degree_string_ar(degree)[1].to_f * 60
#       end_str += sprintf("%02i\"", degree.to_i.to_s)
#     else
#       end_str += "00\""
#     end
#   else
#     end_str += "00'00\""
#   end
#   end_str
# end




p dms(0) #== %(0°00'00")