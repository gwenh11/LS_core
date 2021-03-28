=begin

Write a function that takes two strings, A and B, and returns the length of the longest possible substring that can be formed from the concatenation of either A + B or B + A containing only characters that do not appear in both A and B.

Example:
Given the strings "piquancy" and "refocusing":
A = "piquancy"
B = "refocusing"
A + B = "piquancyrefocusing"
B + A = "refocusingpiquancy"

Since 'i', 'n', 'u', and 'c' appear in both A and B, all acceptable substrings without those characters are:
"p", "q", "a", "yrefo", "s", "g" (from A + B)
"refo", "s", "gp", "q", "a", "y" (from B + A)

Therefore, it would be correct to return 5: the length of "yrefo".

P:
input: two strings( call it a and b)
output: integer (length of the longest substring)
Examine two combinations: a + b and b + a
split the combined strings by the common characters of both a and b
return the string that is the longest

E
find_longest("railroad","is") == 5
railroadis => ra, lroad, s
israilroad => sra, lroad
longest is 'lroad' lenght of 5


D
input: string
array to store all the substrings
output: integer


A
- build the comnined string1 = a + b, and string2 = b + a
- find a the common characters of a and b
  - initialize 'common' array to store common characters
  - convert a and b to arrays of characters
  - iterate through a:
    - iterate through b:
      - compare each character from a with b
      - if it is the same, store it in 'common' array
- create the substrings from string1
  - initialize 'substring1' array
  - initialize 'temp' string
  - iterate through an array of string1 characters
    - if the current character is not in the 'common' array
      - append it to the 'temp'
      - if not, 
        - next
        - append 'temp' to 'substring1'
        - 'temp' = ''
- repeat the same process to create `substring2' for 'string2'
- iterate through 'substring1' and find the longest one
- iterate through 'substring2' and find the longest one
- compare the two, return whichever is longer
        
C

=end

# def find_common_letter(str1, str2)
#   common = []
#   str1.chars.each do |char_a|
#     str2.chars.each do |char_b|
#       if char_a == char_b
#         common << char_a
#       end
#     end
#   end
#   common
# end

# def substrings(letters, common_letter)
#   substring = []
#   temp = ''
#   letters.each do |char_substring|
#     unless common_letter.include?(char_substring)
#       temp << char_substring
#     else
#       substring << temp unless temp.empty?
#       temp = ''
#     end
#   end
#   substring << temp
#   substring
# end

# def find_longest(a, b)
#   arr_str1 = (a + b).chars
#   arr_str2 = (b + a).chars
  
#   common = find_common_letter(a, b)
  
#   substring1 = substrings(arr_str1, common)
#   substring2 = substrings(arr_str2, common)

  
#   substring1_longest = substring1.map { |el| el.length }.max
#   substring2_longest = substring2.map { |el| el.length }.max
  
#   if substring1_longest > substring2_longest
#     substring1_longest
#   else
#     substring2_longest
#   end
# end

# ---
  
=begin

Algorithm 

- make a combination of a + b, and b + a
- find the recurring letters for a + b
- find all the substrings for a + b and b + a and combine them
- from the substrings, I would delete all the substring that include the recurring letters 
- find the longest substring and return the length


=end
  
def find_common_letter(str1, str2)
  common = []
  str1.chars.each do |char_a|
    str2.chars.each do |char_b|
      if char_a == char_b
        common << char_a
      end
    end
  end
  common
end


def substrings(string)
  substrings = []
  0.upto(string.size - 1) do |index|
    1.upto(string.length - index) do |length|
      substrings << string[index, length]
    end
  end
  substrings
end

def find_longest(a, b)
  comb1 = (a + b)
  comb2 = (b + a)
  
  common = find_common_letter(a, b)
  
  substring1 = substrings(comb1)
  substring2 = substrings(comb2)
  
  substrings = substring1 + substring2
  
  filtered = substrings.reject do |substr|
    substr.chars.any? { |letter| common.include?(letter) }
  end

  filtered.max_by { |substr| substr.length }.length
end


# find_longest("railroad","is")
# find_longest("piquancy","refocusing")

p find_longest("piquancy","refocusing") == 5 #=> yrefo
p find_longest("railroad","is") == 5
p find_longest("catfish","surgery") == 11
p find_longest("seven","two") == 8
p find_longest("***aaa","")== 6
