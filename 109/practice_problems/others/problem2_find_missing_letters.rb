# Write a method that takes an array of consecutive (increasing) letters as input and that returns the missing letter in the array.

=begin
P: write a method that returns the missing letter from the letter sequence in the input
input: an array of letters - string data type
      - in the alphabetical order
output: string
      - the missing letter in the input letter sequence

rules:
- input letters can be lowercase or uppercase
- don't need to worry about empty string or non-letter string as input

examples:
compare: a, b, c, d, e, f
input:   a, b, c, d,    f
1st iteration:
  input[0] == compare[0]
  ...

algorithm:
1. create a constant array 'ALPHABET' that contains letters a through z and A through Z
2. Get the sequence from the constant 'ALPHABET' and assign it to 'compare' array
  - the starting element matches the first element in the input array
  - the last element matches the last element in the input array
  - find the start index
    - need to retrieve the first element in the input array and find the index that it occurs in constant 'ALPHABET'
  - do that same thing to find the last index
3. Iterate through the input array:
  - compare each element in the input array with the element in 'compare' at the same index (at current iteration)
  - if the element in 'compare' does not match the one in the input array, 
    - return this element in 'compare' (the missingn element)
- return this element



=end

ALPHABET = ('a'..'z').to_a + ('A'..'Z').to_a

def find_missing_letter(arr)
  start_index = ALPHABET.index(arr[0])
  last_index = ALPHABET.index(arr[-1])
  compare = ALPHABET.slice(start_index..last_index)
  result = (compare - arr).pop
  # arr.each_with_index do |value, index|
  #   return compare[index] if value != compare[index]
  # end
end

p find_missing_letter(["a","b","c","d","f"]) == "e"
p find_missing_letter(["O","Q","R","S"]) == "P" # O, P, Q, R, S
p find_missing_letter(["b","d"]) == "c"
p find_missing_letter(["a","b","d"]) == "c"
p find_missing_letter(["b","d","e"]) == "c"