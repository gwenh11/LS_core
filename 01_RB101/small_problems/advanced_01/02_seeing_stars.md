# 2. Seeing Stars

Write a method that displays an 8-pointed star in an `n`x`n` grid, where `n` is an odd integer that is supplied as an argument to the method. The smallest such star you need to handle is a 7x7 grid.

Examples

```ruby
star(7)

*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *
```

```ruby
star(9)

*   *   *
 *  *  *
  * * *
   ***
*********
   ***
  * * *
 *  *  *
*   *   *
```

#### Further Exploration

What other patterns can you come up with that can be produced in similar ways to the patterns of this exercise? Can you draw a reasonable looking circle? How about a [sine wave](http://www.purplemath.com/modules/grphtrig.htm)? **Skipping this one for now**

**Solution**

```ruby
=begin
- think of this as a square 2D array row (index r) and column (index c) arr[r]
[c]
- grid = []
- column = []
- last_index = n - 1
- middle = n / 2
- counter = 0

- make the grid with blank space:
  - make column: iterate 0 to last_index, append blank space ' '
  - make grid: iterate 0 to last index, duplicate column and append to grid

-  Make vertical star and horizontal star lines:
  - iterate through 0 to last index: 
    - make a star when row number varies with iteration and column number equals to middle
    - repeat the process but varies the column number and row number equals to middle

- Create a loop to make diagonal lines:
  - at middle - 1 row and middle - 1 column a[middle - 1][middle - 1] make one star
  - do the same thing at a[middle - 1][middle + 1]
  - do the same thing at a[middle + 1][middle - 1]
  - do the same thing at a[middle + 1][middle + 1]
  - do the same thing at a[middle - 2][middle - 2]
  - do the same thing at a[middle - 2][middle + 2]
  - position pattern for one star 
      a[middle - counter][middle - counter]
      a[middle - counter][middle + counter]
      a[middle + counter][middle - counter]
      a[middle + counter][middle + counter]
      increment counter by 1
      break loop if middle - counter == 0
- iteration through grid, join each sub array and print to screen
=end

def star(n)
  grid = []
  column = []
  last_index = n - 1
  middle = n / 2
  counter = 0

  # make a n x n grid with blank space
  0.upto(last_index) { column << ' '}
  # could make column this way column = Array.new(n, ' ')
  # this way, each element references the same object
  # (they all have the same object id)
  # it works in this program, because later on we duplicate the collumn and append it to the grid
  # if use grid = Array.new(n, column), changes to grid[last_index] will reflect at other sub arrays in grid
  # the reason is all grid sub array contain the same reference
  0.upto(last_index) { grid << column.dup }

  # make the vertical and horizontal star lines
  0.upto(last_index) do |index|
    grid[middle][index] = '*'
    grid[index][middle] = '*'
  end

  # make diagonnal star lines
  loop do
    grid[middle - counter][middle - counter] = '*'
    grid[middle - counter][middle + counter] = '*'
    grid[middle + counter][middle - counter] = '*'
    grid[middle + counter][middle + counter] = '*'
    break if counter == middle
    counter += 1
  end

  grid.each { |line| puts line.join }
end
```

**LS Solution**

```ruby
def print_row(grid_size, distance_from_center)
  number_of_spaces = distance_from_center - 1
  spaces = ' ' * number_of_spaces
  output = Array.new(3, '*').join(spaces)
  puts output.center(grid_size)
end

def star(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(1) { |distance| print_row(grid_size, distance) }
  puts '*' * grid_size
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end
```

Similar to the Diamonds exercise in Medium section