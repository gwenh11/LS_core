# 5. Multiple Signatures

What do each of these `puts` statements output?

```ruby
a = %w(a b c d e)
# look up fetch method from array class
puts a.fetch(7) #=> IndexError: index 7 outside of array bounds: -5...5 
# index 5 isn't included in the error message range. Index positions from left to right are 0, 1, 2, 3, 4. From right to left are -1, -2, -3, -4, -5. Hence, the range -5...5 in the error message. 
puts a.fetch(7, 'beats me') #=> 'beats me'
puts a.fetch(7) { |index| index**2 } #=> 49
# when invoked with a block, 7 is passed to block paramter index. Because index 7 is out of bound, index**2 is executed. The block returns value 49. 
```

fetch(index) → obj

fetch(index, default) → obj

fetch(index) { |index| block } → obj

**Having multiple lines in the signature means an argument is optional. In this case, both `default` and the block are optional arguments, but they cannot be used together.**

Return the element at position `index`. If `index` is out of bound and no second argument is given, throws `IndexError`. Second argument (`default`) is used to rescue `IndexError` fault. When invoked with a block, block is only executed if invalid `index` is referenced. 

`Array#fetch` does bound checking, but `Array#[]` does not, because `Array#fetch` checks whether the specified element actually exists before fetching it, and raises an error if it does not exist. 