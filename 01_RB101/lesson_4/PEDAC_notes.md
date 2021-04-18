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

- Translating solution algorithm to code
- Think about algorithm in context of programming language
  - Language features and constraints
  - Characteristics of data structures
  - Built-in functions/methods
  - Syntax and coding patterns
- Create test cases
- Code with intent



## Example:

### Palindrome Strings

PROBLEM:

Given a string, write a method change_me which returns the same
string but with all the words in it that are palindromes uppercased.

```ruby
change_me("We will meet at noon") == "We will meet at NOON"
change_me("No palindromes here") == "No palindromes here"
change_me("") == ""
change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"
```

### Problem:

Some items may need clarification:

1. What is a palindrome? 
   - A word that reads the same forwards and backward.
2. Should the words in the string remain the same if they already use uppercase? 
   - In the fourth test case, the word `LOVE` already uses uppercase, and it remains uppercase in the solution.
3. How should I deal with empty strings provided as input?
   - Usually shown in the test cases. In this case, test case number 3 provides the answer. **This is an implicit requirement that we can infer from the test cases.** 
4. Can I assume that all inputs are strings? 
   - Test cases don't show any non-string inputs, so you should ask whether the inputs can contain non-string values, and what you should with them. In this problem, we won't worry about non-string values. 
5. Should I consider letter case when deciding whether a word is a palindrome?
   - Test cases don't show any appropriate examples. This can be confirmed with the interviewer. In this case, palindrome words should be case sensitive: `mom` is a palindrome, `Mom` is not.
6. Do I need to return the same string object or entirely new string? 
   - This question is one of the most important and most overlooked that you can ask. In this problem, you should return an entirely new string.
7. Always verify your assumptions either by looking at the test cases or by asking the interviewer.
   - Some assumptions, like whether we should treat strings as case-sensitive or not, can be verified either by looking at the problem description, if that is mentioned there, or by checking the test case. If you can't determine the answer with the test cases or problem description, you should ask the interviewer to clarify this for you.

```ruby
# input: string
# output: string (not the same object)
# rules:
#      Explicit requirements:
#        - every palindrome in the string must be converted to
#          uppercase. (Reminder: a palindrome is a word that reads
#          the same forwards and backward).
#        - Palindromes are case sensitive ("Dad" is not a palindrome, but "dad" is.)

#      Implicit requirements:
#        - the returned string shouldn't be the same string object.
#        - if the string is an empty string, the result should be an empty
#          array
```



### Palindrome Substrings

```ruby
# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []
```

#### Problem:

- Questions that you can ask:
  1. What is a substrings?
  2. What is a palindrome?
  3. Will input always be strings?
  4. What does it mean to treat palindrome words case-sensitively?
- Input: string
- Output: array of strings
- Explicit requirements:
  - Return only substrings that are palindrome. 
  - a palindrome is a word that reads the same forwards and backward. 
  - palindromes are case sensitive.
- Implicit requirements:
  - Return an empty array if the input string is empty.
  - Return an empty array if no palindromes are found.

#### Algorithm:

```ruby
# High level algorithm:
#  - initialize a result variable to an empty array
#  - create an array named substring_arr that contains all of the
#    substrings of the input string that are at least 2 characters long.
#  - loop through the words in the substring_arr array.
#  - if the word is a palindrome, append it to the result
#    array
#  - return the result array

# Code per high level algorithm:
def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end
```

**Algorithm for `substrings`**:

- We can start with a short word like `halo` and write all its substrings that are at least 2 characters in length. The resulting list is `['ha', 'hal', 'halo', 'al', 'alo', 'lo']`

- We can have the first loop, the outermost loop, iterates over the starting index for the substrings. With `halo` as a starting string, we need to iterate over the letters `h`, `a`, and `l`. We don't need to iterate over `o` since there are no substrings of at least 2 characters that start with `o`.

- Within the first loop, we need to iterate over the substrings that start at the given starting index. It's easiest to start with the substring of length 2, then the substring of length 3, and so on. The resulting loops look something like this:

  ```ruby
  # for each starting index from 0 through the next to last index position
    # for each substring length from 2 until there are no substrings of that length
      # extract the substring of the indicated length starting at the indicate index position
    # end of inner loop
  # end of outer loop.
  ```

- Beginning with the first letter of the string at index 0, `'h'`, we first find all of the substrings that begin with that letter: `['ha', 'hal', 'halo']`. As you can see, we're showing the inner loop at work here:

  - First, we get a 2-letter substring that begins at index 0: `'ha'`
  
  - Next, we get a 3-letter substring that begins at index 0: `'hal'`
  - Finally, we get a 4-letter substring that begins at index 0: `'halo'`
- The loop, in this case, is one that starts with a length of 2 and ends with a length of 4.

- Next, we need to find the substrings that start at index 1 (`a`). The loop, in this case, starts with a length of 2 and ends with a length of 3.
  
  - First, we get a 2-letter substring that begins at index 1: `'al'`
  - Next, we get a 3-letter substring that begins at index 1: `'alo'`
    
  - Finally, we get all of the substrings that begin at index 2. This time, the loop starts and ends with a length of 2, so there is only one iteration:
  
- We get a 2-letter substring that begins at index 2: `'lo'`
  
- What would happen if the original string was, say, 7 characters in length, such as `goalies`? In that case, we'd still have to go through the same process - an outer loop that iterates from index 0 (the letter `g`) to index 5 (the letter `e`), and an inner loop that starts with a length of 2 and continues until there are no substrings of the desired length:
  
  - On the first iteration of the outer loop, the substring length used in the inner loop ranges from 2 to 7.
  - On the second iteration, the substring length ranges from 2 to 6.
  - On the third iteration, the substring length ranges from 2 to 5.
  - On the fourth iteration, the substring length ranges from 2 to 4.
  - On the fifth iteration, the substring length ranges from 2 to 3.
  - On the sixth, the substring length starts and ends at 2.

- Looking at these two examples, we can determine that the outer loop iterates over indexes from 0 to the length of the next to the last index position (e.g., `string.length - 2`). We can also see that the inner loop ranges from 2 to the original string length minus the starting index (`string.length - startingIndex`). We can use both of these facts in our algorithm. Let's go ahead and write the complete algorithm for this method:

  ```ruby
  # - create an empty array called `result` that will contain all required substrings
  # - create a `starting_index` variable (value `0`) for the starting index of a substring
  # - start a loop that iterates over `starting_index` from `0` to the length of the string minus 2
  #   - create a `num_chars` variable (value `2`) for the length of a substring
  #   - start an inner loop that iterates over `num_chars` from `2` to `string.length - starting_index`
  #     - extract a substring of length `num_chars` from `string` starting at `starting_index`
  #     - append the extracted substring to the `result` array
  #     - increment the `num_chars` variable by `1`
  #   - end the inner loop
  #   - increment the `starting_index` variable by `1`
  # - end the outer loop
  # - return the `result` array
  ```

  ```ruby
  # Formal Pseudocode:
  # START
  #
  #   /* Given a string named `string` */
  #
  #   SET result = []
  #   SET starting_index = 0
  #
  #   WHILE starting_index <= length of string - 2
  #     SET numChars = 2
  #     WHILE numChars <= length of string - starting_index
  #       SET substring = num_chars characters from string starting at index starting_index
  #       append substring to result array
  #       SET num_chars = num_chars + 1
  #
  #     SET starting_index = starting_index + 1
  #
  #   RETURN result
  #
  # END
  ```

**Algorithm for `is_palindrome?`**:

```ruby
# - Inside the `is_palindrome?` method, check whether the string
#   value is equal to its reversed value. You can use the
#   String#reverse method.
```

**Entire algorithm:**

```ruby
# input: a string
# output: an array of substrings
# rules: palindrome words should be case sensitive, meaning "abBA"
#        is not a palindrome

# Algorithm:
#  substrings method
#  =================
#    - create an empty array called `result` that will contain all required substrings
#    - create a `starting_index` variable (value `0`) for the starting index of a substring
#    - start a loop that iterates over `starting_index` from `0` to the length of the string minus 2
#      - create a `num_chars` variable (value `2`) for the length of a substring
#      - start an inner loop that iterates over `num_chars` from `2` to `string.length - starting_index`
#        - extract a substring of length `num_chars` from `string` starting at `starting_index`
#        - append the extracted substring to the `result` array
#        - increment the `num_chars` variable by `1`
#      - end the inner loop
#      - increment the `starting_index` variable by `1`
#    - end the outer loop
#    - return the `result` array

#  is_palindrome? method
#  =====================
# - Inside the `is_palindrome?` method, check whether the string
#   value is equal to its reversed value. You can use the
#   String#reverse method.

#  palindrome_substrings method
#  ============================
#  - initialize a result variable to an empty array
#  - create an array named substring_arr that contains all of the
#    substrings of the input string that are at least 2 characters long.
#  - loop through the words in the substring_arr array.
#  - if the word is a palindrome, append it to the result
#    array
#  - return the result array
```



#### Code:

**Code for `substrings`**

```ruby
def substrings(str)
  result = []
  starting_index = 0;

  while (starting_index <= str.length - 2)
    num_chars = 2
    while (num_chars <= str.length - starting_index)
      substring = str.slice(starting_index, num_chars)
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  result
end
```

**Code for `is_palindrome?`**

```ruby
def is_palindrome?(str)
  return str == str.reverse
end
```

**Code for the entire problem:**

```ruby
def substrings(str)
  result = []
  starting_index = 0;

  while (starting_index <= str.length - 2)
    num_chars = 2
    while (num_chars <= str.length - starting_index)
      substring = str.slice(starting_index, num_chars)
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

def is_palindrome?(str)
  str == str.reverse
end

def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end

p palindrome_substrings("supercalifragilisticexpialidocious"); # ["ili"]
p palindrome_substrings("abcddcbA");   # ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome"); # []
p palindrome_substrings("");           # []
```



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
   - All rows have been created when the length of the 'rows' array is equal to the input integer
4. Sum the final row
5. Return the sum



<u>*Problem: Create a row*</u>

Rules:

- Row is an array
- Arrays contain integers
- Integers are consecutive even numbers
- integers in each row form part of an overall larger sequence
- Rows are of different lengths
- Input: the information needed to create the output
  - The starting integer
  - Length of the row
- Output: the row itself: `[8, 10, 12]`



Examples:

start: 2, length: 1 -->  [2]

start: 4, length: 2 --> [4, 6]

start: 8, length: 3 --> [8, 10, 12]



Data Structures:

- An array of integers



Algorithm:

1. Create an empty 'row' array to contain the integers
2. Add the starting integer
3. Increment the starting integer by 2 to get to the next integer in the sequence
4. Repeat steps 2 and 3 until the array has reached the correct length
5. Return the 'row' array



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

p create_row(2, 1) == [2]
p create_row(4, 2) == [4, 6]
p create_row(8, 3) == [8, 10, 12]
```



## Final Thoughts

- Not a completely linear process
- Move back and forward between the steps
- Switch from implementation mode to abstract problem solving mode when necessary
- Don't try to problem solve at the code level
- Testing frequently
- Example: palindrome substrings

```ruby
def substrings(str)
  result = []
  starting_index = 0
  num_chars = 2
end
```

At this point, you may want to check that `slice` methods works correctly and that the second argument should be the length of the substring. To do that you can use `puts` method to output the return value of the `slice` method.

Copy Code

```ruby
def substrings(str)
  result = []
  starting_index = 0
  num_chars = 2
  str.slice(starting_index, num_chars)
end

substrings("abc") # "ab"
```

Next, add a bit more code and test again:

Copy Code

```ruby
def substrings(str)
  result = []
  starting_index = 0
  num_chars = 2
  while starting_index <= str.length - 2
    p str.slice(starting_index, num_chars)
    starting_index += 1
  end
end

substrings("abc");

# Expected output:
# "ab"
# "bc"
```

Continue in this manner. Each time you write a bit of code that you can test, test it and make sure you're getting the answer you expect. Don't wait until you're finished writing the entire program or method or even an entire loop if you can test something earlier. This way, if there is a bug in your code, you'll find it as soon as possible; the sooner you find a bug, the easier it will be to identify what's wrong and fix it.

