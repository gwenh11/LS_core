# Array

#### `Array#reject!`

```ruby
reject! {|item| block} → ary or nil
reject! → Enumerator
```

Deletes every element of `self` for which the block evaluates to `true`, if no changes were made returns `nil`.

The array may not be changed instantly every time the block is called.



# Hash

#### Hash#delete

```ruby
delete(key) → value
delete(key) {| key | block } → block value
```

Deletes the key-value pair and returns the value from `hsh` whose key is equal to `key`. If the key is not found, it returns `nil`. If the optional code block is given and the key is not found, pass in the key and return the result of `block`.

# String

#### String#gsub

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

#### Enumerable#reject

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

#### Enumerable#find_all

**alias of `select`**

```ruby
find_all { |obj| block } → array
find_all → an_enumerator
```

Returns an array containing all elements of `enum` for which the given `block` returns a true value.

