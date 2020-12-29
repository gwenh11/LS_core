# 2. How big is the room?

Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

Note: 1 square meter == 10.7639 square feet

Do not worry about validating the input at this time.

Example Run

```plaintext
Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.0 square meters (753.47 square feet).
```

#### Further Exploration

Modify this program to ask for the input measurements in feet, and display the results in square feet, square inches, and square centimeters.

**Solution**

```ruby
SQMETERS_TO_SQFEET = 10.7639

puts "==> Enter the length of the room in meters:"
length = gets.chomp.to_f

puts "==> Enter the width of the room in meters:"
width = gets.chomp.to_f

area_meters = (length * width).round(2)
# area_feet = (area_meters * SQMETERS_TO_SQFEET).round(2)
area_feet = format('%.2f', area_meters * SQMETERS_TO_SQFEET)
puts "The area of the room is #{area_meters} square meters " + \
     "(#{area_feet} square feet)."

# Use '\' 
```

Use a constant to store the conversion factor between square meters and square feet. Use `Float#round` and `Kernel#format` to round numbers to 2 decimal places for readability.

**Further Exploration**

```ruby
SQMETERS_TO_SQFEET = 10.7639
SQFEET_TO_SQINCHES = 144
SQMETERS_TO_SQCENTIMETERS = 10000

puts "==> Enter the length of the room in meters:"
length = gets.chomp.to_f

puts "==> Enter the width of the room in meters:"
width = gets.chomp.to_f

area_meters = (length * width).round(2)
area_centimeters = (area_meters * SQMETERS_TO_SQCENTIMETERS).round(2)
area_feet = (area_meters * SQMETERS_TO_SQFEET).round(2)
area_inches = (area_feet * SQFEET_TO_SQINCHES).round(2)
puts "The area of the room is #{area_feet} square feet, " + 
     "#{area_inches} square inches, " +
     "#{area_centimeters} square centimeters."
```

