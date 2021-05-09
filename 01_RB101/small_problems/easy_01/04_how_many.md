# 4. How Many?

Write a method that counts the number of occurrences of each element in a given array.

```ruby
vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
```

The words in the array are case-sensitive: `'suv' != 'SUV'`. ` Once counted, print each element alongside the number of occurrences.

Expected output:

```terminal
car => 4
truck => 3
SUV => 1
motorcycle => 2
```



**Solution**

```ruby
# Solution 1
# Include solution from further exploration 'suv' == 'SUV'
# convert all array elements to lower case and reassign the result to the array variable
# it seems to be a better practice to transform the input array rather than mutate it. It is possible that the input array is referenced elsewhere when it comes to a larger program

def count_occurrences(array)
  hash = {}
  array = array.map(&:downcase)
  keys = array.uniq
  keys.each {|key| hash[key] = array.count(key)}
  
  hash.each {|key, count| puts "#{key} => #{count}"}
end

count_occurrences(vehicles)

# Solution 2
def count_occurrences(array)
  downcase_array = array.map(&:downcase)
  downcase_array.tally.each { |k, v| puts "#{k} => #{v}" }
end

count_occurences(vehicles)
```

My solution was very close to the LS solution. However, I forgot to output the solution to screen. I need to look at the problem statement more closely. 

**Other Solutions**

```ruby
def count_occurrences(array)
  # initalize the value of hash to 0
  hash = Hash.new(0)
  array = array.map(&:downcase)
  # for each iteration of the array, create a new key value pair and the value is incremented for the specified key
  array.each {|element| hash[element] += 1}
  
  hash.each {|key, count| puts "#{key} => #{count}"}
end

count_occurrences(vehicles)
```

**This Solution May Not Work Well**

```ruby
def count_occurrences(array)
  hash = {}
  array = array.map(&:downcase)
  keys.each {|key| hash[key] = array.count(key)}
  
  hash.each {|key, count| puts "#{key} => #{count}"}
end

count_occurrences(vehicles)
```

This solution doesn't create an of unique keys. At the iteration where the element already exists in the hash, a new key value pair is created and overrides the existing one. `#count` count the total frequencies of elements. It produces the same result. 

