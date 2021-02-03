# Transpose 3x3

A 3 x 3 matrix can be represented by an Array of Arrays in which the main Array and all of the sub-Arrays has 3 elements. For example:

Copy Code

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

An Array of Arrays is sometimes called nested arrays because each of the inner Arrays is nested inside an outer Array.

To access an element in `matrix`, you use `Array#[]` with both the row index and column index. So, in this case, `matrix[0][2]` is `8`, and `matrix[2][1]` is 9. An entire row in the matrix can be referenced by just using one index: `matrix[1]` is the row (an Array) `[4, 7, 2]`. Unfortunately, there's no convenient notation for accessing an entire column.

The transpose of a 3 x 3 matrix is the matrix that results from exchanging the columns and rows of the original matrix. For example, the transposition of the array shown above is:

```ruby
1  4  3
5  7  9
8  2  6
```

Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns the transpose of the original matrix. Note that there is a `Array#transpose` method that does this -- you may not use it for this exercise. You also are not allowed to use the `Matrix` class from the standard library. Your task is to do this yourself.

Take care not to modify the original matrix: you must produce a new matrix and leave the original matrix unchanged.

Examples

```ruby
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
```

#### Further Exploration

Write a `transpose!` method that transposes a matrix in place. The obvious solution is to reuse `transpose` from above, then copy the results back into the array specified by the argument. For this method, don't use this approach; write a method from scratch that does the in-place transpose.

```ruby
# best I can do at the moment
def transpose(matrix)
  0.upto(2) do |column_index|
    temp = matrix[0][column_index]
    matrix[0][column_index] = matrix[column_index][0]
    matrix[column_index][0] = temp
  end

  temp = matrix[2][1]
  matrix[2][1] = matrix[1][2]
  matrix[1][2] = temp
    
  matrix
end
```



**Solution**

```ruby
=begin
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

Output
1  4  3
5  7  9
8  2  6

element at matrix[0][0] stays
matrix[0][1] becomes matrix[1][0]
matrix[0][2] becomes matrix[2][0]

matrix[1][0] becomes matrix[0][1]
matrix[1][1] becomes matrix[1][1]
matrix[1][2] becomes matrix[2][1]

matrix[2][0] becomes matrix[0][2]
matrix[2][1] becomes matrix[1][2]
matrix[2][2] becomes matrix[2][2]
=end

def transpose(matrix)
  column = []
  result = []
  0.upto(2) { column << [] }
  0.upto(2) { result << column.dup }
  0.upto(2) do |row|
    0.upto(2) do |column|
      result[row][column] = matrix[column][row]
    end
  end
  result
end
```

**LS Solution**

```ruby
def transpose(matrix)
  result = []
  (0..2).each do |column_index|
    new_row = (0..2).map { |row_index| matrix[row_index][column_index] }
    result << new_row
  end
  result
end
```

We start by initializing the result Array, then we iterate through the columns in our original matrix. **In each iteration, we construct a new row consisting of all of the elements in that column**, and append that to our result. Thus, the first column becomes the first row in the result, the second column becomes the second row, and the third column becomes the third row. Finally, we return the result.

```ruby
def transpose(arr)
  arr.map.with_index do |subarr, i|
    subarr.map.with_index do |_, j|
      arr[j][i]
    end
  end
end
```