

**What does the code output and/or return? Why? and What concept does the example demonstrate?**



# Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.

# p minSubLength([2,3,1,2,4,3], 7) == 2
# p minSubLength([1, 10, 5, 2, 7], 9) == 1
# p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
p minSubLength([1, 2, 4], 8) == 0



[[1, 2], [3, 4]].map {|arr| puts arr[0]}

output 1 and 3

return value is [nil, nil]

returns a new array object populated with the return values of the block in each iteration. It transform the original array based the return value of the block.



['ant', 'bear'].map do |elem|
  if elem.length > 3
    elem
  end
end



[1, 2, 3].select { |num| puts'bye'}

when the block evaluates to true



mammal = "dog"

loop do |mammal|
  mammal = "cat"
  break
end

puts mammal

variable shadowing

reassining the parameter on line 4

DON't SAY:

# On line `1` we initialize variable `mammal` and assign string "dog"

paramater hs the same name as the variable initialized in the outer scope

loop parameter is initalized nil



def my_method(str)
  str += "!!!"

  str.downcase!
end

favorite = "My favorite string"

my_method(favorite)

puts favorite

It's important to say this: when the method is invoked, both 'str' and favorite are pointing to the same string object.

we reassign  'str' variable to a different string object and for that reason, from now on 'str' and 'favorite are no longer pointing to the same string object

that means that we can no longer mutate the object gavorite variable points to adn that is why line 11 outputs'

downcase! was invoked on str -> it is invoked on the object str variable points to 

for variables: initialize them, we can reassign them and we can pass them as arguments to a method call

mutation, calling method on, the object variable points to

def my_method
  puts "written assessment"
end

some_var = my_method

initialize variable some_var to the return value of my_method

instntiating is for object, not variable

if some_var
  puts "written assessment"
else
  puts "interview"
end



solution to the first problem:

def minSubLength(array, num)
  1.upto(array.size) do |sub_size|
    array.each_cons(sub_size).each {|sub_arr| return sub_size if sub_arr.sum >= num}
  end
  0
end

- find all subarrays
  - can use two loops, one that starts from the first index and inner one which starts from the index of the outer loop and goes until the end (and I take all numbers between those indexes) and add them to the result
  - upto, each _index
- select only subarrays which sum is greater than the target
- find the subarray with minimum length of those subarrays

def min_sub_length(arr, s)

subs = find_subarrays(arr)

subs_greater_than_target = find_greater_than_target(subs, s)

find_min_length_sub

end

def find_subarrays(arr)

result = 0.upto(arr.length-1).each do |start_idx|

(start_idx).upto(arr.length - 1).each do |end_idx

result << arr[start_indx..end_idx]

end

end

result

end

def find_greater_than_target(subs,s)
  subs.select {|sub| sub.sum >= s}
end

def find_min_length_sub(subs)
  return 0 if subs.empty?
  subs.map {|sub| sub.length}.min
end



how to solve problems without knowing the programming language

