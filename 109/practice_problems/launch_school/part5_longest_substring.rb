=begin
Find the length of the longest substring in the given string that is the same in reverse.

As an example, if the input was 'I like racevars that go fast", the substring (racecar) length would be 7.

If the length of the input string is 0, return value must be 0.

Example:
"a" => 1
"aab" => 2
"abcde" => 1
"zzbaabcd" => 4
"" => 0
=end

=begin
Find the length of the longest substring in the given string that is the same in reverse.

As an example, if the input was 'I like racecar that go fast", the substring (racecar) length would be 7.

If the length of the input string is 0, return value must be 0.

Example:
"a" => 1
"aab" => 2
"abcde" => 1
"zzbaabcd" => 4
"" => 0
=end

=begin
**Problem**

Input: string
Output: integer 
        - the length of the longest substring in the input string

Questions: N/A


Rules (Explicit/Implicit):
- the substring needs to be:
  - same order forward and backward
  - has the longest length
- subtring is defined as 
  - a word demilited by spaces, or
  - contains part of intput string
- input contains letters and numbers


Edge Cases:
- return 0 if the length of the input string is 0
- return 1 if the length of the input string is 1
- return the size of the string if all the characters are the same

**Examples**
'baa' => substring 'aa'
b, ba, baa
a, aa
a

''baabcd'=> 'baab'

**Data Structure**
string
array

**Algorithm**
- return 0 if the input string is empty
- find all the possible substrings from the input string and assign it to 'substrings' array (helper method)
  - intialize empty 'substring' array
  - iterate through start_index 0 to the size of the input
    - iterate through length of 1 to input size - start_index
      - reference the portion of the input from start_index at current
      - append this portion to 'substring' array
      
- sort 'substrings' by size in descending order and assign it to 'sorted_substring'
- iterate through 'sorted_substrings'
  - return the size of the element is it reads the same forward as backwards


=end

def longest_palindrome(str)
  return 0 if str.empty?
  substrings = find_substrings(str)
  sorted_substrings = substrings.sort { |a, b| b.length <=> a.length }
  sorted_substrings.each do |substring|
    return substring.length if substring == substring.reverse
  end
end

def find_substrings(str)
  substrings = []
  (0...str.length).each do |start_index|
    (1..str.length - start_index).each do |length|
    substrings << str[start_index, length]
    end
  end
  substrings
end

p longest_palindrome('a') == 1
p longest_palindrome('aa') == 2
p longest_palindrome('baa') == 2
p longest_palindrome('aab') == 2
p longest_palindrome('baabcd') == 4
p longest_palindrome('baablkj12345432133d') == 9