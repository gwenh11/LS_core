# 4. All Substrings

Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

You may (and should) use the `leading_substrings` method you wrote in the previous exercise:

Examples:

```ruby
substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
```

**Solution**

```ruby
def substrings(str)
  result = []
  str.size.times do |count|
    temp = str[count..-1]
    result << temp.chars.map.with_index { |_, index| temp[0..index]}
  end
  result.flatten
end
```

**LS Solution**

```ruby
def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(leading_substrings(this_substring))
  end
  results
end
```

This problem is a lot easier if you use the `leading_substrings` method from the previous exercise. Without that method, it can be really hard to wrap your head around the requirements and come up with a working solution.

The solution boils down to just repeatedly running `leading_substrings` on increasingly smaller substrings of `string`, starting with the 1st character, then the 2nd character, and so on. The results are all concatenated to our `results` Array which is subsequently returned to the caller.

Our `leading_substrings` method returns substrings in order from shortest to longest, and `substrings` itself works from left to right in the string. Our results are thus arranged in the desired sequence.

```ruby
def substrings(str)
  substrings_arr = []
  0.upto(str.length - 1) do |idx|
    1.upto(str.length - idx) do |length|
      substrings_arr << str[idx, length]
    end
  end
  substrings_arr
end
```

