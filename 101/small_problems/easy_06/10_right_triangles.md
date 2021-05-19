# Right Triangles

Write a method that takes a positive integer, `n`, as an argument, and displays a right triangle whose sides each have `n` stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

Examples:

```ruby
triangle(5)

    *
   **
  ***
 ****
*****
```

```ruby
triangle(9)

        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********
```

**Solution**

```ruby
=begin
**Problem**
output a right triangle
Input: integer
Output: a triangle shown as stars

Questions: N/A


Rules (Explicit/Implicit):
- both triangle sides are equal
- one end at the lower-left and one end at the upper-right
- assume valid input of positive integer
- to make triangle starts on the upper right
  - need to put some blank space before stars
  - the length of the whole line is input number
  - blank space length is input number subtract number of stars
  - length of stars is current length of triangle

Edge Cases: N/A


**Examples** N/A


**Data Structure**
integer
range

**Algorithm**
- iterate through a range from 1 to input integer
  - current number in range is the size of the current side of the right triangle
  - output a number of blank space 
    - blank space length is input subtract current number in range
  - output a number of stars
    - this number is equal to the current number in range

=end

def triangle(num)
  (1..num).each do |current_num|
    puts ' ' * (num - current_num) + '*' * current_num
  end
end
```

**LS Solution**

```ruby
def triangle(num)
  spaces = num - 1
  stars = 1

  num.times do |n|
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1
    stars += 1
  end
end
```

#### Further Exploration

Try modifying your solution so it prints the triangle upside down from its current orientation. Try modifying your solution again so that you can display the triangle with the right angle at any corner of the grid.

```ruby
# upside down
def triangle(num)
  num.times do |current_num|
    puts ' ' * current_num + '*' * (num - current_num)
  end
end

# right triangle at any corner of the grid
def triangle(num, top_or_bottom, right_or_left)
  num.times do |current_num|
    case top_or_bottom
    when 'top'
      num_of_space = current_num
      num_of_stars = num - num_of_space
      if right_or_left == 'right'
        puts star_line(num_of_space, num_of_stars)
      else
        puts star_line(num_of_space, num_of_stars).reverse
      end
    when 'bottom'
      num_of_stars = current_num + 1
      num_of_space = num - num_of_stars
      if right_or_left == 'right'
        puts star_line(num_of_space, num_of_stars)
      else
        puts star_line(num_of_space, num_of_stars).reverse
      end
    end
  end
end

def star_line(num_of_space, num_of_stars)
  ' ' * num_of_space + '*' * num_of_stars
end

triangle(5, 'top', 'left')
triangle(5, 'top', 'right')
triangle(5, 'bottom', 'left')
triangle(5, 'bottom', 'right')
```

