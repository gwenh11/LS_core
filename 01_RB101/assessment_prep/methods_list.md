# Array

#### `Array#reject!`

```ruby
reject! {|item| block} → ary or nil
reject! → Enumerator
```

Deletes every element of `self` for which the block evaluates to `true`, if no changes were made returns `nil`.

The array may not be changed instantly every time the block is called.



#### `Array#reverse_each`

```ruby
reverse_each {|item| block} → ary
reverse_each → Enumerator
```

Same as [#each](https://ruby-doc.org/core-2.7.2/Array.html#method-i-each), but traverses `self` in reverse order.



#### `Array#shift`

**opposite of `unshift`**

```ruby
shift → obj or nil
shift(n) → new_ary
```

Removes the first element of `self` and returns it (shifting all other elements down by one). Returns `nil` if the array is empty.

If a number `n` is given, returns an array of the first `n` elements (or less) just like `array.slice!(0, n)` does. With `ary` containing only the remainder elements, not including what was shifted to `new_ary`. 

```ruby
args = [ "-m", "-q", "filename" ]
args.shift     #=> "-m"
args           #=> ["-q", "filename"]

args = [ "-m", "-q", "filename" ]
args.shift(2)  #=> ["-m", "-q"]
args           #=> ["filename"]
```



#### `Array#unshift`

**opposite of `shift`**

```ruby
unshift(obj, ...) → ary
prepend(obj, ...) → ary
```

Prepends objects to the front of `self`, moving other elements upwards.

```ruby
a = [ "b", "c", "d" ]
a.unshift("a")   #=> ["a", "b", "c", "d"]
a.unshift(1, 2)  #=> [ 1, 2, "a", "b", "c", "d"]
```



# Hash

#### `Hash#delete`

```ruby
delete(key) → value
delete(key) {| key | block } → block value
```

Deletes the key-value pair and returns the value from `hsh` whose key is equal to `key`. If the key is not found, it returns `nil`. If the optional code block is given and the key is not found, pass in the key and return the result of `block`.



# String

#### `String#gsub`

```ruby
gsub(pattern, replacement) → new_st
gsub(pattern, hash) → new_str
gsub(pattern) {|match| block } → new_str
gsub(pattern) → enumerator
```

Substitute *all occurrences* of `pattern` for `replacement` in `str` and return a `new_str`

`pattern` is typically a Regexp. Update this when learn more about Regex.

https://ruby-doc.org/core-2.7.2/String.html#method-i-gsub



# Enumerable

#### `Enumerable#each_with_object`

```ruby
each_with_object(obj) { |(*args), memo_obj| ... } → obj
each_with_object(obj) → an_enumerator
```

Iterates the given block for each element with an arbitrary object given, and returns the initially given object.

```ruby
evens = (1..10).each_with_object([]) { |i, a| a << i*2 }
#=> [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
```



#### `Enumerable#inject`

**alias of `reduce`**

```ruby
inject(initial, sym) → obj
inject(sym) → obj
inject(initial) { |memo, obj| block } → obj
inject { |memo, obj| block } → obj
```

Combines all elements of `enum` by applying a binary operation, specified by a block or a symbol that names a method or operator.

If given a block, for each iteration, each element in the collection and a accumulator value (`memo`) are passed to the block. If given a symbol, each element in the collection will passed to the named method of `memo`. At the end of the iteration, the final value of `memo` is the return value for the method.

If an `initial` value is not specified for `memo`, the first element in the collection is used as the initial value of `memo`.

```ruby
# Sum some numbers
(5..10).reduce(:+)                             #=> 45
# Same using a block and inject
(5..10).inject { |sum, n| sum + n }            #=> 45
# Multiply some numbers
(5..10).reduce(1, :*)                          #=> 151200
# Same using a block
(5..10).inject(1) { |product, n| product * n } #=> 151200
# find the longest word
longest = %w{ cat sheep bear }.inject do |memo, word|
   memo.length > word.length ? memo : word
end
longest                                        #=> "sheep"

arr = [1,2,3,4]
arr.inject([]) { |memo, value| memo.unshift(value) } #=> [4, 3, 2, 1]
```



#### `Enumerable#reject`

**opposite of `find_all` or `select`**

```ruby
reject { |obj| block } → array
reject → an_enumerator
```

Returns an array for all elements of `enum` for which the given block returns false.

If no block is given, an Enumerator is returned instead.

```ruby
(1..10).reject { |i|  i % 3 == 0 }   #=> [1, 2, 4, 5, 7, 8, 10]

[1, 2, 3, 4, 5].reject { |num| num.even? } #=> [1, 3, 5]
```



#### `Enumerable#find_all`

**alias of `select`**

```ruby
find_all { |obj| block } → array
find_all → an_enumerator
```

Returns an array containing all elements of `enum` for which the given `block` returns a true value.



#### `Enumerable#reverse_each`

```ruby
reverse_each(*args) { |item| block } → enum
reverse_each(*args) → an_enumerator
```

Builds a temporary array and traverses that array in reverse order.

```ruby
(1..3).reverse_each { |v| p v }
# Output
# 3
# 2
# 1
```

