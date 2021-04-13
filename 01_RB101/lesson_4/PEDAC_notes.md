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

- 

## A: Algorithms



## C: Implementing A Solution In Code





## Example:

### Sum Even Number Rows

Imagine a sequence of consecutive even integers beginning with 2. The integers are grouped in rows, with the first row containing one integer, the second row two integers, the third row three integers, and so on. Given an integer representing the number of a particular row, return an integer representing the sum of all the integers in that row.

#### P:

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