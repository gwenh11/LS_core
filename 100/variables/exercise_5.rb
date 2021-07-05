# Example 1
x = 0
3.times do
  x += 1
end
puts x

# Example 2
y = 0
3.times do
  y += 1
  x = y
end
puts x

=begin
Example 1 prints 3 to the screen. Example 2 throws an error code "undefined local variable or method", 
because x is created inside the do/end block and is not accessibale outside of this block
=end