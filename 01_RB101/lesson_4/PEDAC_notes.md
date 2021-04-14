# The PEDAC Process

## P: Understanding the Problem
- Establish the rules/define the boundaries of the problem. It can be just a summary of the problem in your own words. 
  - 	Assess available information
  - 	Restate explicit requirements
  - 	Identify implicit requirements
- Spend enough time. Don't rush this step
- Example: Given a string, produce a new string with every other word removed.
  - Explicit requirements:
    - Input: string
    - Output: new string
    - Remove every other word from input string
  - Questions:
    - What do we mean by every other word?
    - How do we define a word in this context?
      - Words are delimited by spaces

## E: Example and Test Cases

- Can confirm/refute assumptions
- Help to answer questions about implicit requirements
- Act as assertions which help to codify the rules and boundaries

## D: Data Structures

- Help reason with data logically
- Help interact with data at implementation level
- Thinking in terms of data structures is part of problem solving process
- Data structures closely linked to algorithm
  - Set of step from input to output
    - Involves structuring data in a certain way

## A: Algorithms

- A logical sequence of steps for accomplishing a task or objective
  - Closely linked to data structures
  - Series of steps to structure data to produce required output
- Stay abstract/ high level
  - Avoid implementation details such as references to particular methods or built-in functions
  - Don't worry about efficiency for now

## C: Implementing A Solution In Code





## Example:

### Sum Even Number Rows

Imagine a sequence of consecutive even integers beginning with 2. The integers are grouped in rows, with the first row containing one integer, the second row two integers, the third row three integers, and so on. Given an integer representing the number of a particular row, return an integer representing the sum of all the integers in that row.

#### Problem:

**Rules/Requirements**

- Sequence of EVEN integers
- Sequence begins with two
- Integers are consecutive
- Sequence is grouped in to rows
- Each row incrementally larger: 1, 2, 3, ...
- Row 'number' equals the number of elements in the row
  - Row 1 has 1 element, row 2 has two elements, ...
- Input: a single integer
  - Identifies a 'row', which is a subset of a sequence of integers
- Output: a single integer
  - The sum of integers in the row identified by the input integer



- Sequence:

2, 4, 6, 8, 10, 12, 14, 16, 18, ...



2

4, 6

8, 10, 12

14, 16, 18, 20

...

- How do we create the structure?

#### Examples:

row number: 1 --> sum of integers in row: 2

row number: 2 --> sum of integers in row: 10

row number: 4 --> sum of integers in row: 68



2 --> 2

4, 6 --> 10



14, 16, 18, 20 --> 68

#### Data Structure:

2

4, 6

8, 10, 12

14, 16, 18, 20

...

- Overall structure representing sequence as a whole
- Individual rows within overall structure
- Individual rows in a set order in context of sequence

- Individual rows contain integers
- Can assume that integers are in a set order in the context of sequence

[

​	[2],

​	[4, 6],

​	[8, 10, 12],

​	[14, 16, 18, 20],

​	...

]

#### Algorithm:

1. Create an empty 'rows' array to contain all of the rows
2. Create a 'row' array and add it to the overall 'rows' array
3. Repeat step 2 until all the necessary rows have been created
4. Sum the final row
5. Return the sum



*Problem: Create a row*

Rules:

- Row is an array
- Arrays contain integers
- Integers are consecutive even numbers
- integers in each row form part of an overall larger sequence
- Rows are of different lengths
- 





```ruby
def sum_even_number_row(row_number)
  rows = []
  start_integer = 2
  (1..row_number).each do |current_row_number|
    rows << create_row(start_integer, current_row_number)
    start_integer = rows.last.last + 2
  end
  # TODO: sum the final row and return the sum
  final_row_num = 0
  rows.last.each { |num| final_row_sum += sum }
  final_row_sum
  # rows.last.reduce { |final_row_sum, num| final_row_sum + num }
  # rows.last.sum
end

def create_row(start_integer, row_length)
  row = []
  current_integer = start_integer
  loop do
    row << current_integer
    current_integer += 2
    break if row.length == row_length
  end
  row
end

p sum_even_number_row(1) == 2
p sum_even_number_row(2) == 10
p sum_even_number_row(4) == 68
```

