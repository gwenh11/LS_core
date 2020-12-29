# 4. Mandatory Blocks

The `Array#bsearch` method is used to search ordered `Array`s more quickly than `#find` and `#select` can. Assume you have the following code:

```ruby
a = [1, 4, 8, 11, 15, 19]
value = a.bsearch { |num| num > 8}
p value
```

How would you search this `Array` to find the first element whose value exceeds `8`?

## Array#bsearch

bsearch {|x| block } → elem

By using binary search, finds a value from this array which meets the given condition in O(log n) where n is the size of the array

The usual use case is "find-minimum mode", which is also used in this example. In this mode, the block must return `true` or `false` 