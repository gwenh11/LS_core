# 5. Rotating Matrices

As we saw in the previous exercises, a matrix can be represented in ruby by an Array of Arrays. For example:

```ruby
1  5  8
4  7  2
3  9  6
```

can be described by the Array of Arrays:

```ruby
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]
```

A 90-degree rotation of a matrix produces a new matrix in which each side of the matrix is rotated clockwise by 90 degrees. For example, the 90-degree rotation of the matrix shown above is:

```ruby
3  4  1
9  7  5
6  2  8
```

A 90 degree rotation of a non-square matrix is similar. For example, the rotation of:

```ruby
3  4  1
9  7  5
```

is:

```ruby
9  3
7  4
5  1
```

Write a method that takes an arbitrary matrix and rotates it 90 degrees clockwise as shown above.

Examples

```ruby
matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2
```

This program should print "true" three times.

**Solution**

```ruby
def rotate90(matrix)
  new_line = []
  result = []
  line_index = 0
  
  1.upto(matrix.first.size) do
    matrix.each do |line|
      new_line.prepend(line[line_index])
    end
    result << new_line
    line_index += 1
    new_line = []
  end

  result
end
```

**LS Solution**

```ruby
def rotate90(matrix)
  result = []
  number_of_rows = matrix.size
  number_of_columns = matrix.first.size
  (0...number_of_columns).each do |column_index|
    new_row = (0...number_of_rows).map do |row_index|
      matrix[row_index][column_index]
    end
    result << new_row.reverse
  end
  result
end
```

#### Further Exploration

Can you modify your solution to perform 90, 180, 270, and 360 degree rotations based on an argument?

```ruby
def rotate90(matrix)
  new_line = []
  result = []
  line_index = 0

    1.upto(matrix.first.size) do
      matrix.each do |line|
        new_line.prepend(line[line_index])
      end
      result << new_line
      line_index += 1
      new_line = []
    end

  result
end

def times90_rotation(matrix, degree_rotation)
  rotation90_times = degree_rotation / 90
  rotation90_times.times { matrix = rotate90(matrix) }
  matrix
end
```

