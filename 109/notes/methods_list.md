# Method List

Methods of similar usages, but have slight differences in implementation are placed next to each other.



## Object

#### `Object#===`

```ruby
obj === other → true or false
```

Case Equality – For class [Object](https://ruby-doc.org/core-2.7.2/Object.html), effectively the same as calling `#==`, but typically overridden by descendants to provide meaningful semantics in `case` statements.



#### `Kernel#rand`

```ruby
rand(max=0) → number
```

If called without an argument, or if `max.to_i.abs == 0`, rand returns a pseudo-random floating point number between 0.0 and 1.0, including 0.0 and excluding 1.0.

When `max.abs` is greater than or equal to 1, `rand` returns a pseudo-random integer greater than or equal to 0 and less than `max.to_i.abs`.

When `max` is a `Range`, return a random number in range.

```ruby
rand        #=> 0.2725926052826416
rand(100)   #=> 12
rand(20..200)  #=> 69
```



## Integer

#### `Integer#ceil`

```ruby
ceil([ndigits]) → integer or float
```

Round up or round down `int` with a precision of `ndigits` decimal digits (default: 0)

When the precision is negative, the returned value is an integer with at least `ndigits.abs` trailing zeros.

Return `self` when `ndigits` is zero or positive.

```ruby
1.ceil           #=> 1
1.ceil(2)        #=> 1
18.ceil(-1)      #=> 20
(-18).ceil(-1)   #=> -10
```



#### `Integer#chr`

```ruby
chr([encoding]) → string
```

Returns a string containing the character represented by the `int`'s value according to `encoding`.

Note: RB101 shows simple use of this method. The method returns ASCII character value of the integer that is called on, like the first example below.

```ruby
65.chr    #=> "A"
230.chr   #=> "\xE6"
255.chr(Encoding::UTF_8)   #=> "\u00FF"
```



#### `Integer#digits`

```ruby
digits → array
digits(base) → array
```

Returns the digits of `int`'s place-value representation with radix `base` (default: 10). The digits are returned as an array with the least significant digit as the first array element.

`base` must be greater than or equal to 2.

```ruby
12345.digits      #=> [5, 4, 3, 2, 1]
12345.digits(100) #=> [45, 23, 1]
-12345.digits(7)  #=> Math::DomainError
```



#### `Integer#fdiv`

```ruby
fdiv(numeric) → float
```

Return the floating point result of dividing `int` by `numeric`



#### `Integer#next`

```ruby
next → integer
```
**alias of `succ`**
return a new integer equal to `int + 1`

```ruby
1.next      #=> 2
(-1).next   #=> 0
1.succ      #=> 2
(-1).succ   #=> 0
```



#### `Integer#upto`

```ruby
upto(limit) {|i| block } → self
upto(limit) → an_enumerator
```

Iterates the given block, passing in integer values from `int` up to and including `limit`.



#### `Integer#times`

**alias of `each`**

```ruby
times {|i| block } → self
times → an_enumerator
```

Iterates the given block `int` times, passing in values from zero to `int - 1`.

```ruby
5.times {|i| print i, " " }   #=> 0 1 2 3 4
```



## Float

#### `Float#ceil`

```ruby
ceil([ndigits]) → integer or float
```

Round up or round down `float` with a precision of `ndigits` decimal digits (default: 0)

When the precision is negative, the returned value is an integer with at least `ndigits.abs` trailing zeros.

Returns a floating point number when `ndigits` is positive, otherwise returns an integer.

```ruby
1.2.ceil      #=> 2
2.0.ceil      #=> 2
(-1.2).ceil   #=> -1
(-2.0).ceil   #=> -2

1.234567.ceil(2)   #=> 1.24
1.234567.ceil(3)   #=> 1.235
1.234567.ceil(4)   #=> 1.2346
1.234567.ceil(5)   #=> 1.23457

34567.89.ceil(-5)  #=> 100000
34567.89.ceil(-4)  #=> 40000
34567.89.ceil(-3)  #=> 35000
34567.89.ceil(-2)  #=> 34600
34567.89.ceil(-1)  #=> 34570
34567.89.ceil(0)   #=> 34568
34567.89.ceil(1)   #=> 34567.9
34567.89.ceil(2)   #=> 34567.89
34567.89.ceil(3)   #=> 34567.89
```

Note that the limited precision of floating point arithmetic might lead to surprising results:

```ruby
(2.1 / 0.7).ceil  #=> 4 (!)
```



#### `Float#round`

```ruby
round([ndigits] [, half: mode]) → integer or float
```

Round `float` to the nearest value with a precision of `ndigits` decimal digits (default: 0)

When the precision is negative, the returned value is an integer with at least `ndigits.abs` trailing zeros.

Returns a floating point number when `ndigits` is positive, otherwise returns an integer.

```ruby
1.4.round      #=> 1
(-1.5).round   #=> -2
1.234567.round(2)   #=> 1.23
34567.89.round(-5)  #=> 0
34567.89.round(-4)  #=> 30000
34567.89.round(0)   #=> 34568
34567.89.round(1)   #=> 34567.9
```

f the optional `half` keyword argument is given, numbers that are half-way between two possible rounded values will be rounded according to the specified tie-breaking `mode`:

- `:up` or `nil`: round half away from zero (default)
- `:down`: round half toward zero
- `:even`: round half toward the nearest even number

```ruby
2.5.round(half: :up)      #=> 3
2.5.round(half: :down)    #=> 2
2.5.round(half: :even)    #=> 2
3.5.round(half: :up)      #=> 4
3.5.round(half: :down)    #=> 3
3.5.round(half: :even)    #=> 4
(-2.5).round(half: :up)   #=> -3
(-2.5).round(half: :down) #=> -2
(-2.5).round(half: :even) #=> -2
```



## Numeric

#### `Numeric#divmod`

```ruby
divmod(numeric) → array
```

Return an array containing the quotient and modulus obtained by diving `num` by `numeric`.

If either `num` or `numeric` a float, the modulus in the result array will be a float.



#### `Numeric#abs`

```ruby
abs → numeric
```

Returns the absolute value of `num`.



#### `Numeric#step`

```ruby
step(by: step, to: limit) {|i| block } → self
step(by: step, to: limit) → an_enumerator
step(by: step, to: limit) → an_arithmetic_sequence
step(limit=nil, step=1) {|i| block } → self
step(limit=nil, step=1) → an_enumerator
step(limit=nil, step=1) → an_arithmetic_sequence
```

Invokes the given block with the sequence of numbers starting at `num`, incremented by `step` (defaulted to `1`) on each call until the `limit` is reached. `limit` is defaulted to infinity.

If any of the arguments are floating point numbers, all are converted to floats, and the loop is executed *floor(n + n\*Float::EPSILON) + 1* times, where *n = (limit - num)/step*.

```ruby
p 1.step.take(4)
p 10.step(by: -1).take(4)
3.step(to: 5) {|i| print i, " " }
1.step(10, 2) {|i| print i, " " }
Math::E.step(to: Math::PI, by: 0.2) {|f| print f, " " }

# Output
[1, 2, 3, 4]
[10, 9, 8, 7]
3 4 5
1 3 5 7 9
2.718281828459045 2.9182818284590453 3.118281828459045
```



## Range

#### `Range#step`

```ruby
step(n=1) {| obj | block } → rng
step(n=1) → an_enumerator
step(n=1) → an_arithmetic_sequence
rng % n → an_enumerator
rng % n → an_arithmetic_sequence
```

Iterates over the range, passing each `n`th element to the block. If begin and end are numeric, `n` is added for each iteration. Otherwise [step](https://ruby-doc.org/core-2.7.3/Range.html#method-i-step) invokes `succ` to iterate through range elements. It looks like the method keeps track of how many elements are in the range. The iteration is incremented by `n` until there are no more elements in range.

```ruby
range = Xs.new(1)..Xs.new(10)
range.step(2) {|x| puts x}
puts
range.step(3) {|x| puts x}

# Output
 1 x
 3 xxx
 5 xxxxx
 7 xxxxxxx
 9 xxxxxxxxx

 1 x
 4 xxxx
 7 xxxxxxx
10 xxxxxxxxxx
```



## Array

#### `Array#*`

```ruby
ary * int → new_ary
ary * str → new_string
```

Repetition — With a [String](https://ruby-doc.org/core-2.7.3/String.html) argument, equivalent to `ary.join(str)`.

Otherwise, returns a new array built by concatenating the `int` copies of `self`.

```ruby
[ 1, 2, 3 ] * 3    #=> [ 1, 2, 3, 1, 2, 3, 1, 2, 3 ]
[ 1, 2, 3 ] * ","  #=> "1,2,3"
```



#### `Array#+`

```ruby
ary + other_ary → new_ary
```

Concatenation — Returns a new array built by concatenating the two arrays together to produce a third array.



#### `Array#-`

```ruby
ary - other_ary → new_ary
```

Array Difference - Returns a new array that is a copy of the original array, removing all occurrences of any item that also appear in `other_ary`. The order is preserved from the original array.



#### `Array#&`

```ruby
ary & other_ary → new_ary
```

Set Intersection — Returns a new array containing unique elements common to the two arrays. The order is preserved from the original array.

```ruby
[ 1, 1, 3, 5 ] & [ 3, 2, 1 ]                 #=> [ 1, 3 ]
[ 'a', 'b', 'b', 'z' ] & [ 'a', 'b', 'c' ]   #=> [ 'a', 'b' ]
```



#### `Array#|`

```ruby
ary | other_ary → new_ary
```

Return a new array that is the union of two arrays. The result contains no duplicates.



#### `Array#combination`

```ruby
combination(n) {|c| block} → ary
combination(n) → Enumerator
```

When given a block, yield all combinations of length `n` of elements from the array and then return the array itself. **Different orders of the same elements DO NOT make different combinations.**

The implementation makes no guarantees about the order in which the combinations are yielded.

```ruby
a = [1, 2, 3, 4]
a.combination(1).to_a  #=> [[1],[2],[3],[4]]
a.combination(2).to_a  #=> [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
a.combination(3).to_a  #=> [[1,2,3],[1,2,4],[1,3,4],[2,3,4]]
a.combination(4).to_a  #=> [[1,2,3,4]]
a.combination(0).to_a  #=> [[]] # one combination of length 0
a.combination(5).to_a  #=> []   # no combinations of length 5
```



#### `Array#permutation`

```ruby
permutation {|p| block} → ary
permutation → Enumerator
permutation(n) {|p| block} → ary
permutation(n) → Enumerator
```

When given a block, yield all combinations of length `n` of elements from the array and then return the array itself. **Different orders of the same elements DO make different combinations.**

The implementation makes no guarantees about the order in which the combinations are yielded.

```ruby
a = [1, 2, 3]
a.permutation.to_a    #=> [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
a.permutation(1).to_a #=> [[1],[2],[3]]
a.permutation(2).to_a #=> [[1,2],[1,3],[2,1],[2,3],[3,1],[3,2]]
a.permutation(3).to_a #=> [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
a.permutation(0).to_a #=> [[]] # one permutation of length 0
a.permutation(4).to_a #=> []   # no permutations of length 4
```



#### `Array#delete`

```ruby
delete(obj) → item or nil
delete(obj) {block} → item or result of block
```

Deletes all items from `self` that are equal to `obj`.

Returns the last deleted item, or `nil` if no matching item is found.

If the optional code block is given, the result of the block is returned if the item is not found. (To remove `nil` elements and get an informative return value, use [#compact!](https://ruby-doc.org/core-2.7.2/Array.html#method-i-compact-21))



#### `Array#delete_at`

**similar to `slice!`**

```ruby
delete_at(index) → obj or nil
```

Delete the element at the specified `index`, returning that element, or `nil` if the index is out of range.

```ruby
a = ["ant", "bat", "cat", "dog"]
a.delete_at(2)    #=> "cat"
a                 #=> ["ant", "bat", "dog"]
a.delete_at(99)   #=> nil
```



#### `Array#delete_if`

**similar to `reject`**

```ruby
delete_if {|item| block} → ary
delete_if → Enumerator
```

Deletes every element of `self` for which block evaluates to `true`.

The array is changed instantly every time the block is called, not after the iteration is over.

```ruby
scores = [ 97, 42, 75 ]
scores.delete_if {|score| score < 80 }   #=> [97]
```



#### `Array#keep_if`

**opposite of `delete_if`**

```ruby
keep_if {|item| block} → ary
keep_if → Enumerator
```

Deletes every element of `self` for which the given block evaluates to `false`, and returns `self`.



#### `Array#each_index`

```ruby
each_index {|index| block} → ary
each_index → Enumerator
```

Same as [#each](https://ruby-doc.org/core-2.7.3/Array.html#method-i-each), but passes the `index` of the element instead of the element itself.



#### `Array#find_index`

**alias of `index` and similar to `rindex`**

```ruby
find_index(obj) → int or nil
find_index {|item| block} → int or nil
find_index → Enumerator
```

Returns the `index` of the first object in `ary` such that the object is `==` to `obj`.

If a block is given instead of an argument, returns the *index* of the **first** object for which the block returns `true`. Returns `nil` if no match is found.



#### `Array#rindex`

**similar to `find_index`**

```ruby
rindex(obj) → int or nil
rindex {|item| block} → int or nil
rindex → Enumerator
```

Returns the *index* of the last object in `self` `==` to `obj`.

If a block is given instead of an argument, returns the `index` of the first object for which the block returns `true`, starting from the **last** object. Returns `nil` if no match is found.



#### `Array#first`

**opposite of `last`**

```ruby
first → obj or nil
first(n) → new_ary
```

Returns the first element, or the first `n` elements, of the array. If the array is empty, the first form returns `nil`, and the second form returns an empty array. 



#### `Array#last`

**opposite of `first`**

```ruby
ast → obj or nil
last(n) → new_ary
```

Returns the last element(s) of `self`. If the array is empty, the first form returns `nil`.



#### `Array#flatten`

```ruby
 → new_ary
(level) → new_ary
```

Returns a new array that is a one-dimensional flattening of `self` (recursively). That is, for every element that is an array, extract its elements into the new array. The optional `level` argument determines the level of recursion to .

```ruby
s = [ 1, 2, 3 ]           #=> [1, 2, 3]
t = [ 4, 5, 6, [7, 8] ]   #=> [4, 5, 6, [7, 8]]
a = [ s, t, 9, 10 ]       #=> [[1, 2, 3], [4, 5, 6, [7, 8]], 9, 10]
a.                 #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
a = [ 1, 2, [3, [4, 5] ] ]
a.(1)              #=> [1, 2, 3, [4, 5]]  down 1 level
```



#### `Array#insert`

```ruby
insert(index, obj...) → ary
```

Inserts the given values before the element with the given `index`. Negative indices count backwards from the end of the array, where `-1` is the last element. If a negative index is used, the given values will be inserted after that element, so using an index of `-1` will insert the values at the end of the array.

```ruby
a = %w{ a b c d }
a.insert(2, 99)         #=> ["a", "b", 99, "c", "d"]
a.insert(-2, 1, 2, 3)   #=> ["a", "b", 99, "c", 1, 2, 3, "d"]
```



#### `Array#none?`

```ruby
none? [{ |obj| block }] → true or false
none?(pattern) → true or false
```

Passes each element of the collection to the given block. The method returns `true` if the block never returns `true` for all elements. If the block is not given, `none?` will return `true` only if none of the collection members is true.

If instead a pattern is supplied, the method returns whether `pattern === element` for none of the collection members.

```
%w{ant bear cat}.none? { |word| word.length == 5 } #=> true
%w{ant bear cat}.none? { |word| word.length >= 4 } #=> false
%w{ant bear cat}.none?(/d/)                        #=> true
[1, 3.14, 42].none?(Float)                         #=> false
[].none?                                           #=> true
[nil].none?                                        #=> true
[nil, false].none?                                 #=> true
[nil, false, true].none?                           #=> false
```



#### `Array#reject`

**opposite of `delete_if`**

```ruby
reject {|item| block } → new_ary
reject → Enumerator
```

Returns a new array containing the items in `self` for which the given block is not `true`. The ordering of non-rejected elements is maintained.



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



#### `Array#rotate`

```ruby
rotate(count=1) → new_ary
```

Returns a new array by rotating `self` so that the element at `count` is the first element of the new array.

If `count` is negative then it rotates in the opposite direction, starting from the end of `self` where `-1` is the last element.

```ruby
a = [ "a", "b", "c", "d" ]
a.rotate         #=> ["b", "c", "d", "a"]
a                #=> ["a", "b", "c", "d"]
a.rotate(2)      #=> ["c", "d", "a", "b"]
a.rotate(-3)     #=> ["b", "c", "d", "a"]
```



#### `Array#rotate!`

**similar to `rotate` but destructive**



#### `Array#sample`

```ruby
sample → obj
sample(random: rng) → obj
sample(n) → new_ary
sample(n, random: rng) → new_ary
```

Choose a random element or `n` random elements from the array.

The elements are chosen by using random and unique indices into the array in order to ensure that an element doesn’t repeat itself unless the array already contained duplicate elements.

If the array is empty the first form returns `nil` and the second form returns an empty array. Choose a random element or `n` random elements from the array.

The elements are chosen by using random and unique indices into the array in order to ensure that an element doesn’t repeat itself unless the array already contained duplicate elements.

If the array is empty the first form returns `nil` and the second form returns an empty array.

```ruby
a = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
a.sample         #=> 7
a.sample(4)      #=> [6, 4, 2, 5]
```

The optional `rng` argument will be used as the random number generator.

```ruby
a.sample(random: Random.new(1))     #=> 6
a.sample(4, random: Random.new(1))  #=> [6, 10, 9, 2]
```



#### `Array#shift`

**similar to `pop` and opposite of `unshift`**

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



#### `Array#uniq`

```ruby
uniq → new_ary
uniq {|item| ...} → new_ary
```

Return a new array by removing duplicate values in `self`. If given a block, the return value of the block is used for comparison. 

```ruby
b = [["student", "sam"], ["teacher", "george"], ["teacher", "matz"]]
b.uniq { |s| s.first }
#=> [["student", "sam"], ["teacher", "matz"]]
# block returns first element of sub-array. Using 1st element as comparison, remove sub-array that have duplicate 1st element.
```



#### `Array#slice`

**similar to `[]`**

```ruby
slice(index) → obj or nil
slice(start, length) → new_ary or nil
slice(range) → new_ary or nil
```

Element reference. 

Negative indices count backward from the end of the array (-1 is the last element). Additionally, an empty array is returned when the starting index for an element range is at the end of the array. Returns `nil` if the index (or starting index) are out of range.



#### `Array#slice!`

```ruby
slice!(index) → obj or nil
slice!(start, length) → new_ary or nil
slice!(range) → new_ary or nil
```

Deletes the element(s) given by an `index` (optionally up to `length` elements) or by a `range`.

Returns the deleted object (or objects), or `nil` if the `index` is out of range.



#### `Array#zip`

```ruby
zip(arg, ...) → new_ary
zip(arg, ...) {|arr| block} → nil
```

convert any arguments to arrays, then merges elements of `self` with corresponding elements from each argument.

This generates a sequence of `ary.size` *n*-element arrays, where *n* is one more than the count of arguments.

If the size of any argument is less than the size of the initial array, `nil` values are supplied.

If a block is given, it is invoked for each output `array`, otherwise an array of arrays is returned.

```ruby
a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
[1, 2, 3].zip(a, b)   #=> [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
[1, 2].zip(a, b)      #=> [[1, 4, 7], [2, 5, 8]]
a.zip([1, 2], [8])    #=> [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
```



## Hash

#### `Hash::new`

```rubynew → new_hash
new → new_hash
new(obj) → new_hash
new {|hash, key| block } → new_hash
```

Returns a new, empty hash. If this hash is subsequently accessed by a key that doesn’t correspond to a hash entry, the value returned depends on the style of `new` used to create the hash. In the first form, the access returns `nil`. If *obj* is specified, this single object will be used for all *default values*. If a block is specified, it will be called with the hash object and the key, and should return the default value. It is the block’s responsibility to store the value in the hash if required.

```ruby
h = Hash.new("Go Fish")
h["a"] = 100
h["b"] = 200
h["a"]           #=> 100
h["c"]           #=> "Go Fish"
# The following alters the single default object
h["c"].upcase!   #=> "GO FISH"
h["d"]           #=> "GO FISH"
h.keys           #=> ["a", "b"]

# While this creates a new default object each time
h = Hash.new { |hash, key| hash[key] = "Go Fish: #{key}" }
h["c"]           #=> "Go Fish: c"
h["c"].upcase!   #=> "GO FISH: C"
h["d"]           #=> "Go Fish: d"
h.keys           #=> ["c", "d"]
```



#### `Hash#delete`

```ruby
delete(key) → value
delete(key) {| key | block } → block value
```

Deletes the key-value pair and returns the value from `hsh` whose key is equal to `key`. If the key is not found, it returns `nil`. If the optional code block is given and the key is not found, pass in the key and return the result of `block`.



#### `Hash#delete_if`

```ruby
delete_if {| key, value | block } → hsh
delete_if → an_enumerator
```

Deletes every key-value pair from `hsh` for which *block* evaluates to `true`.

```ruby
h = { "a" => 100, "b" => 200, "c" => 300 }
h.delete_if {|key, value| key >= "b" }   #=> {"a"=>100}
```



#### `Hash#slice`

```ruby
slice(*keys) → a_hash
```

Returns a hash containing only the given keys and their values.

```ruby
h = { a: 100, b: 200, c: 300 }
h.slice(:a)           #=> {:a=>100}
h.slice(:b, :c, :d)   #=> {:b=>200, :c=>300}
```



## String

#### `String#*`

```ruby
str * integer → new_str
```

Copy — Returns a new String containing `integer` copies of the receiver. `integer` must be greater than or equal to 0.

```ruby
"Ho! " * 3   #=> "Ho! Ho! Ho! "
"Ho! " * 0   #=> ""
```



#### `String#chr`

```ruby
chr → string
```

Returns a one-character string at the beginning of the string.

```ruby
a = "abcde"
a.chr    #=> "a"
```



#### `String#count`

If anything in the calling object matches the argument string, the count increases by 1. For example, if passing in String `'AB'`, but there is only one `'A'` in the calling object and NO `'B'`. The count still returns 1

```ruby
a = 'ACDF'
a.count('AB') #=> 1
```



#### `String#delete`

```ruby
delete([other_str]) → new_str
```

Returns a copy of `str` with all characters in the intersection of its arguments deleted. Uses the same rules for building the set of characters as [#count](https://ruby-doc.org/core-2.7.2/String.html#method-i-count).

```ruby
"hello".delete "l","lo"        #=> "heo"
"hello".delete "lo"            #=> "he"
"hello".delete "aeiou", "^e"   #=> "hell"
"hello".delete "ej-m"          #=> "ho"
```



#### `String#delete!`

```ruby
delete!([other_str]+) → str or nil
```

Performs a `delete` operation in place, returning `str`, or `nil` if `str` was not modified.



#### `String#each_char`

```ruby
each_char {|cstr| block } → str
each_char → an_enumerator
```

Passes each character in *str* to the given block, or returns an enumerator if no block is given.



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



#### `String#sub`

```ruby
sub(pattern, replacement) → new_str
sub(pattern, hash) → new_str
sub(pattern) {|match| block } → new_str
```

Returns a copy of `str` with the *first* occurrence of `pattern` replaced by the second argument.

If the second argument is a [Hash](https://ruby-doc.org/core-2.7.3/Hash.html), and the matched text is one of its keys, the corresponding value is the replacement string.



#### `String#sub!`

```ruby
sub!(pattern, replacement) → str or nil
sub!(pattern) {|match| block } → str or nil
```

Performs the same substitution as [#sub](https://ruby-doc.org/core-2.7.3/String.html#method-i-sub) in-place.



#### `String#tr`

```ruby
tr(from_str, to_str) => new_str
```

Returns a copy of `str` with the characters in `from_str` replaced by the corresponding characters in `to_str`. If `to_str` is shorter than `from_str`, it is padded with its last character in order to maintain the correspondence.

```ruby
"hello".tr('el', 'ip')      #=> "hippo"
"hello".tr('aeiou', '*')    #=> "h*ll*"
"hello".tr('aeiou', 'AA*')  #=> "hAll*"
```

Both strings may use the `c1-c2` notation to denote ranges of characters, and `from_str` may start with a `^`, which denotes all characters except those listed.

```ruby
"hello".tr('a-y', 'b-z')    #=> "ifmmp"
"hello".tr('^aeiou', '*')   #=> "*e**o"
```

The backslash character `\` can be used to escape `^` or `-` and is otherwise ignored unless it appears at the end of a range or the end of the `from_str` or `to_str`:

```ruby
"hello^world".tr("\\^aeiou", "*") #=> "h*ll**w*rld"
"hello-world".tr("a\\-eo", "*")   #=> "h*ll**w*rld"

"hello\r\nworld".tr("\r", "")   #=> "hello\nworld"
"hello\r\nworld".tr("\\r", "")  #=> "hello\r\nwold"
"hello\r\nworld".tr("\\\r", "") #=> "hello\nworld"

"X['\\b']".tr("X\\", "")   #=> "['b']"
"X['\\b']".tr("X-\\]", "") #=> "'b'"
```



#### `String#tr!`

**similar to `String#tr` but mutating**



#### `String#insert`

```ruby
insert(index, other_str) → str
```

Inserts *other_str* before the character at the given *index*, modifying *str*. Negative indices count from the end of the string, and insert *after* the given character. The intent is insert *aString* so that it starts at the given *index*.

```ruby
"abcd".insert(0, 'X')    #=> "Xabcd"
"abcd".insert(3, 'X')    #=> "abcXd"
"abcd".insert(4, 'X')    #=> "abcdX"
"abcd".insert(-3, 'X')   #=> "abXcd"
"abcd".insert(-1, 'X')   #=> "abcdX"
```



#### `String#ord`

```ruby
ord → integer
```

Returns the [Integer](https://ruby-doc.org/core-2.7.3/Integer.html) ordinal of a one-character string.



#### `String#partition`

```ruby
partition(sep) → [head, sep, tail]
partition(regexp) → [head, match, tail]
```

Searches *sep* or pattern (*regexp*) in the string and returns the part before it, the match, and the part after it. If it is not found, returns two empty strings and *str*.

```ruby
"hello".partition("l")         #=> ["he", "l", "lo"]
"hello".partition("x")         #=> ["hello", "", ""]
"hello".partition(/.l/)        #=> ["h", "el", "lo"]
```



#### `String#slice`

**similar to `[]`**

```ruby
slice(index) → new_str or nil
slice(start, length) → new_str or nil
slice(range) → new_str or nil
slice(regexp) → new_str or nil
slice(regexp, capture) → new_str or nil
slice(match_str) → new_str or nil
```

Element reference.

 If an index is negative, it is counted from the end of the string. Additionally, an empty string is returned when the starting index for a character range is at the end of the string. Returns `nil` if the index (or starting index) are out of range.



#### `String#slice!`

```ruby
slice!(integer) → new_str
slice!(integer, integer) → new_str or nil
slice!(range) → new_str or nil
slice!(regexp) → new_str or nil
slice!(other_str) → new_str or nil
```

Deletes the specified portion from `str`, and returns the portion deleted.



#### `String#upto`

```ruby
upto(other_str, exclusive=false) {|s| block } → str
upto(other_str, exclusive=false) → an_enumerator
```

Iterates through successive values, starting at *str* and ending at *other_str* inclusive, passing each value in turn to the block. The [#succ](https://ruby-doc.org/core-2.7.3/String.html#method-i-succ) method is used to generate each value. If optional second argument exclusive is omitted or is false, the last value will be included; otherwise it will be excluded.

```ruby
"a8".upto("b6") {|s| print s, ' ' }
for s in "a8".."b6"
  print s, ' '
end
```

```ruby
a8 a9 b0 b1 b2 b3 b4 b5 b6
a8 a9 b0 b1 b2 b3 b4 b5 b6
```





## Enumerable

#### `Enumerable#all?`

```ruby
all? [{ |obj| block } ] → true or false
all?(pattern) → true or false
```

`all?` will return `true` if the block passed to it never returns a value of `false` or `nil` for every element in the `[collection]`

If instead a pattern is supplied, the method returns whether `pattern === element` for every collection member.



#### `Enumerable#none?`

```ruby
none? [{ |obj| block }] → true or false
none?(pattern) → true or false
```

Passes each element of the collection to the given block. The method returns `true` if the block never returns `true` for all elements. If the block is not given, `none?` will return `true` only if none of the collection members is true.

If instead a pattern is supplied, the method returns whether `pattern === element` for none of the collection members.

**See examples in `Array#none?`**



#### `Enumerable#any?`

```ruby
any? [{ |obj| block }] → true or false
any?(pattern) → true or false
```

`any?` looks at the *truthiness* of the **block's** return value in order to determine what the **method's** return value will be. If the block returns a "truthy" value for any element in the collection, then the method will return `true`.

If instead a pattern is supplied, the method returns whether `pattern === element` for any collection member.

```ruby
%w[ant bear cat].any? { |word| word.length >= 3 } #=> true
%w[ant bear cat].any? { |word| word.length >= 4 } #=> true
%w[ant bear cat].any?(/d/)                        #=> false
[nil, true, 99].any?(Integer)                     #=> true
[nil, true, 99].any?                              #=> true
[].any?                                           #=> false
```



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



#### `Enumerable#each_cons`

```ruby
each_cons(n) { ... } → nil
each_cons(n) → an_enumerator
```

Iterate the given block for the consecutive `n` elements in the array. The starting point varies from index `0` until `array.size - n`.

```ruby
(1..10).each_cons(3) { |a| p a }
# outputs below
[1, 2, 3]
[2, 3, 4]
[3, 4, 5]
[4, 5, 6]
[5, 6, 7]
[6, 7, 8]
[7, 8, 9]
[8, 9, 10]
```



#### `Enumerable#each_slice`

```ruby
each_slice(n) { ... } → nil
each_slice(n) → an_enumerator
```

Iterate the given block for each group of `n` consecutive elements. The starting point of the following group begins after the group from before. The last group can be less than the specified size `n`.

```ruby
(1..10).each_slice(3) { |a| p a }
# outputs below
[1, 2, 3]
[4, 5, 6]
[7, 8, 9]
[10]
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



#### `Enumerable#reduce`

**alias of `inject` - see `inject` for implementation** 



#### `Enumerable#find_all`

**alias of `select`**

```ruby
find_all { |obj| block } → array
find_all → an_enumerator
```

Returns an array containing all elements of `enum` for which the given `block` returns a true value.



#### `Enumerable#find`

```ruby
find(ifnone = nil) { |obj| block } → obj or nil
find(ifnone = nil) → an_enumerator
```

Passes each entry in `enum` to block. Returns the first for which block is `true`. If no object matches, calls `ifnone` and returns its result when it is specified, or returns `nil` otherwise.

```ruby
(1..10).find(-> {0})   { |i| i % 5 == 0 && i % 7 == 0 }   #=> 0
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



#### `Enumerable#max_by`

```ruby
max_by {|obj| block } → objclick to toggle source
max_by → an_enumerator
max_by(n) {|obj| block } → obj
max_by(n) → an_enumerator
```

Returns the object in *enum* that gives the maximum value from the given block.

If no block is given, an enumerator is returned instead.

```
a = %w(albatross dog horse)
a.max_by { |x| x.length }   #=> "albatross"
```

If the `n` argument is given, maximum `n` elements are returned as an array. These `n` elements are sorted by the value from the given block, in descending order.

```
a = %w[albatross dog horse]
a.max_by(2) {|x| x.length } #=> ["albatross", "horse"]
```

enum.max_by(n) can be used to implement weighted random sampling. Following example implements and use Enumerable#wsample.

```ruby
module Enumerable
  # weighted random sampling.
  #
  # Pavlos S. Efraimidis, Paul G. Spirakis
  # Weighted random sampling with a reservoir
  # Information Processing Letters
  # Volume 97, Issue 5 (16 March 2006)
  def wsample(n)
    self.max_by(n) {|v| rand ** (1.0/yield(v)) }
  end
end
e = (-20..20).to_a*10000
a = e.wsample(20000) {|x|
  Math.exp(-(x/5.0)**2) # normal distribution
}
# a is 20000 samples from e.
p a.length #=> 20000
h = a.group_by {|x| x }
-10.upto(10) {|x| puts "*" * (h[x].length/30.0).to_i if h[x] }
#=> *
#   ***
#   ******
#   ***********
#   ******************
#   *****************************
#   *****************************************
#   ****************************************************
#   ***************************************************************
#   ********************************************************************
#   ***********************************************************************
#   ***********************************************************************
#   **************************************************************
#   ****************************************************
#   ***************************************
#   ***************************
#   ******************
#   ***********
#   *******
#   ***
#   *
```



#### `Enumerable#partition`

```ruby
partition { |obj| block } → [ true_array, false_array ]
partition → an_enumerator
```

Returns two arrays, the first containing the elements of *enum* for which the block evaluates to true, the second containing the rest.

```ruby
(1..6).partition { |v| v.even? }  #=> [[2, 4, 6], [1, 3, 5]]
```

Even if the collection is a hash, the return value of `partition` will always be an array. To transform these arrays back into a hash, we can invoke `Array#to_h`.



#### `Enumerable#slice_when`

```ruby
slice_when {|elt_before, elt_after| bool } → an_enumerator
```

Split each chunk using adjacent elements `elt_before` and `elt_after` where the blocks returns `true`. The block is called the length of the receiver enumerator minus one.

he result enumerator yields the chunked elements as an array. So `each` method can be called as follows:

```
enum.slice_when { |elt_before, elt_after| bool }.each { |ary| ... }
```

Other methods of the [Enumerator](https://ruby-doc.org/core-2.7.3/Enumerator.html) class and [Enumerable](https://ruby-doc.org/core-2.7.3/Enumerable.html) module, such as `to_a`, `map`, etc., are also usable.

For example, one-by-one increasing subsequence can be chunked as follows:

```
a = [1,2,4,9,10,11,12,15,16,19,20,21]
b = a.slice_when {|i, j| i+1 != j }
p b.to_a #=> [[1, 2], [4], [9, 10, 11, 12], [15, 16], [19, 20, 21]]
c = b.map {|a| a.length < 3 ? a : "#{a.first}-#{a.last}" }
p c #=> [[1, 2], [4], "9-12", [15, 16], "19-21"]
d = c.join(",")
p d #=> "1,2,4,9-12,15,16,19-21"
```

Near elements (threshold: 6) in sorted array can be chunked as follows:

```
a = [3, 11, 14, 25, 28, 29, 29, 41, 55, 57]
p a.slice_when {|i, j| 6 < j - i }.to_a
#=> [[3], [11, 14], [25, 28, 29, 29], [41], [55, 57]]
```

Increasing (non-decreasing) subsequence can be chunked as follows:

```
a = [0, 9, 2, 2, 3, 2, 7, 5, 9, 5]
p a.slice_when {|i, j| i > j }.to_a
#=> [[0, 9], [2, 2, 3], [2, 7], [5, 9], [5]]
```

Adjacent evens and odds can be chunked as follows: (Enumerable#chunk is another way to do it.)

```
a = [7, 5, 9, 2, 0, 7, 9, 4, 2, 0]
p a.slice_when {|i, j| i.even? != j.even? }.to_a
#=> [[7, 5, 9], [2, 0], [7, 9], [4, 2, 0]]
```

Paragraphs (non-empty lines with trailing empty lines) can be chunked as follows: (See [#chunk](https://ruby-doc.org/core-2.7.3/Enumerable.html#method-i-chunk) to ignore empty lines.)

```
lines = ["foo\n", "bar\n", "\n", "baz\n", "qux\n"]
p lines.slice_when {|l1, l2| /\A\s*\z/ =~ l1 && /\S/ =~ l2 }.to_a
#=> [["foo\n", "bar\n", "\n"], ["baz\n", "qux\n"]]
```

[#chunk_while](https://ruby-doc.org/core-2.7.3/Enumerable.html#method-i-chunk_while) does the same, except splitting when the block returns `false` instead of `true`.



#### `Enumerable#chunk_while`

```ruby
chunk_while {|elt_before, elt_after| bool } → an_enumerator
```

**similar to `slice_when` but split when the block returns `false` instead of true.**  



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



#### `Enumerable#tally`

```ruby
tally -> a_hash
```

Tally the collection - count the occurrences of each element. Return a hash with the elements of the collection as keys and the corresponding counts as values.

```ruby
["a", "b", "c", "b"].tally  #=> {"a"=>1, "b"=>2, "c"=>1}
```



#### `Enumerable#zip`

**similar to `Array#zip`**

```ruby
zip(arg, ...) → an_array_of_arrayclick to toggle source
zip(arg, ...) { |arr| block } → nil
```

can be used on `Range`



## Brute Force for Some Built-In Methods

#### `Enumerable#tally`

```ruby
["a", "b", "c", "b"].tally  #=> {"a"=>1, "b"=>2, "c"=>1}

def tally(arr)
  hash = {}
  
  keys = arr.uniq
  keys.each { |key| hash[key] = arr.count(key) }

  hash
end

def count_occurrences(array)
  # initalize the value of hash to 0
  hash = Hash.new(0)
  array = array.map(&:downcase)
  # for each iteration of the array, create a new key value pair and the value is incremented for the specified key
  array.each {|element| hash[element] += 1}
  
  hash.each {|key, count| puts "#{key} => #{count}"}
end

# Array#count is disabled
def tally(arr)
  hash = {}
  
  arr.each do |value|
    if hash.include?(value)
      hash[value] += 1
    else
      hash[value] = 1
    end
  end

  hash
end
```



#### `Integer#digits`

```ruby
def digit_list(number)
    number.to_s.chars.map(&:to_i).reverse
end

def digit_list(number)
    digits = []
    loop do
        number, remainder = number.divmod(10)
      	# returns [1234, 5]
        # use parallel assignment to assign values to number and remainder
        digits.unshift(remainder)
        # prepend remainder to digits array
        break if number == 0
    end
    digits
end
```



#### `String#to_i`

```ruby
NUMBERS_HASH = ('0'..'9').zip(0..9).to_h

def string_to_integer(num_str)
  num_str.chars.inject(0) { |num, dig_str| num * 10 + NUMBERS_HASH[dig_str] }
end

def string_to_signed_integer(num_str)
  multiplier = 1
  multiplier = -1 if num_str[0] == '-'
  multiplier * string_to_integer(num_str[1..-1])
end
```



#### `Integer#to_s`

```ruby
DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def signed_integer_to_string(number)
  if number > 0
    sign = '+'
  elsif number < 0
    sign = '-'
  else
    sign = ''
  end

  result = ''
  loop do
    number, remainder = number.abs.divmod(10)
    result.prepend(DIGITS[remainder])
    break if number == 0
  end

  sign.concat(result)
end
```



## Some Helpful Methods

#### Find substrings

```ruby
# Using Enumerable#each_cons
a = "hello there"
results = []

counter = 1
loop do
  a.chars.each_cons(counter) { |sub_arr| results << sub_arr }
  break if counter == a.size
  counter += 1
end

pp results
# Output
[["h"],
 ["e"],
 ["l"],
 ["l"],
 ["o"],
 [" "],
 ["t"],
 ["h"],
 ["e"],
 ["r"],
 ["e"],
 ["h", "e"],
 ["e", "l"],
 ["l", "l"],
 ["l", "o"],
 ["o", " "],
 [" ", "t"],
 ["t", "h"],
 ["h", "e"],
 ["e", "r"],
 ["r", "e"],
 ["h", "e", "l"],
 ["e", "l", "l"],
 ["l", "l", "o"],
 ["l", "o", " "],
 ["o", " ", "t"],
 [" ", "t", "h"],
 ["t", "h", "e"],
 ["h", "e", "r"],
 ["e", "r", "e"],
 ["h", "e", "l", "l"],
 ["e", "l", "l", "o"],
 ["l", "l", "o", " "],
 ["l", "o", " ", "t"],
 ["o", " ", "t", "h"],
 [" ", "t", "h", "e"],
 ["t", "h", "e", "r"],
 ["h", "e", "r", "e"],
 ["h", "e", "l", "l", "o"],
 ["e", "l", "l", "o", " "],
 ["l", "l", "o", " ", "t"],
 ["l", "o", " ", "t", "h"],
 ["o", " ", "t", "h", "e"],
 [" ", "t", "h", "e", "r"],
 ["t", "h", "e", "r", "e"],
 ["h", "e", "l", "l", "o", " "],
 ["e", "l", "l", "o", " ", "t"],
 ["l", "l", "o", " ", "t", "h"],
 ["l", "o", " ", "t", "h", "e"],
 ["o", " ", "t", "h", "e", "r"],
 [" ", "t", "h", "e", "r", "e"],
 ["h", "e", "l", "l", "o", " ", "t"],
 ["e", "l", "l", "o", " ", "t", "h"],
 ["l", "l", "o", " ", "t", "h", "e"],
 ["l", "o", " ", "t", "h", "e", "r"],
 ["o", " ", "t", "h", "e", "r", "e"],
 ["h", "e", "l", "l", "o", " ", "t", "h"],
 ["e", "l", "l", "o", " ", "t", "h", "e"],
 ["l", "l", "o", " ", "t", "h", "e", "r"],
 ["l", "o", " ", "t", "h", "e", "r", "e"],
 ["h", "e", "l", "l", "o", " ", "t", "h", "e"],
 ["e", "l", "l", "o", " ", "t", "h", "e", "r"],
 ["l", "l", "o", " ", "t", "h", "e", "r", "e"],
 ["h", "e", "l", "l", "o", " ", "t", "h", "e", "r"],
 ["e", "l", "l", "o", " ", "t", "h", "e", "r", "e"],
 ["h", "e", "l", "l", "o", " ", "t", "h", "e", "r", "e"]]

# Brute force
a = "hello there"
results = []

(0...a.size).each do |start_index|
  (1..a.size - start_index).each do |length|
    results << a.chars[start_index, length]
  end
end

pp sorted_results = results.sort_by(&:length)
```



#### Find sub_arrays

##### Permutation

Element index position matters, thus it makes a new combination

```ruby
length = 1
arr = [1, 2, 3, 4]
result = []

loop do
  result += arr.permutation(length).to_a
  break if length == arr.size
  length += 1
end

pp result

# Output
[[1],
 [2],
 [3],
 [4],
 [1, 2],
 [1, 3],
 [1, 4],
 [2, 1],
 [2, 3],
 [2, 4],
 [3, 1],
 [3, 2],
 [3, 4],
 [4, 1],
 [4, 2],
 [4, 3],
 [1, 2, 3],
 [1, 2, 4],
 [1, 3, 2],
 [1, 3, 4],
 [1, 4, 2],
 [1, 4, 3],
 [2, 1, 3],
 [2, 1, 4],
 [2, 3, 1],
 [2, 3, 4],
 [2, 4, 1],
 [2, 4, 3],
 [3, 1, 2],
 [3, 1, 4],
 [3, 2, 1],
 [3, 2, 4],
 [3, 4, 1],
 [3, 4, 2],
 [4, 1, 2],
 [4, 1, 3],
 [4, 2, 1],
 [4, 2, 3],
 [4, 3, 1],
 [4, 3, 2],
 [1, 2, 3, 4],
 [1, 2, 4, 3],
 [1, 3, 2, 4],
 [1, 3, 4, 2],
 [1, 4, 2, 3],
 [1, 4, 3, 2],
 [2, 1, 3, 4],
 [2, 1, 4, 3],
 [2, 3, 1, 4],
 [2, 3, 4, 1],
 [2, 4, 1, 3],
 [2, 4, 3, 1],
 [3, 1, 2, 4],
 [3, 1, 4, 2],
 [3, 2, 1, 4],
 [3, 2, 4, 1],
 [3, 4, 1, 2],
 [3, 4, 2, 1],
 [4, 1, 2, 3],
 [4, 1, 3, 2],
 [4, 2, 1, 3],
 [4, 2, 3, 1],
 [4, 3, 1, 2],
 [4, 3, 2, 1]]
```



##### Combination

Element index position does not matter, thus it does not make a new combination

```ruby
length = 1
arr = [1, 2, 3, 4]
result = []

loop do
  result += arr.combination(length).to_a
  break if length == arr.size
  length += 1
end

pp result

# Output
[[1],
 [2],
 [3],
 [4],
 [1, 2],
 [1, 3],
 [1, 4],
 [2, 3],
 [2, 4],
 [3, 4],
 [1, 2, 3],
 [1, 2, 4],
 [1, 3, 4],
 [2, 3, 4],
 [1, 2, 3, 4]]
```



#### Split elements and groups similar elements together

```ruby
=begin
- intialize empty array 'groups'
- intialize 'temp' array to first element of input array
- iterate through a range of indices 0 to the next to last element of input array
  - if 'temp' value equals to the element in input array at index + 1
    - append the element in input array at index + 1 to 'temp'
  - otherwise,
    - append 'temp' to 'groups'
    - reinitialize 'temp' to the element in input at the index after the current one (index + 1) for comparision at the next iteration
- after the iteration, the 'else' branch doesn't execute because there is nothing else to compare it to. Therefore, 'temp' will have a value that needs to be appended to 'groups'
- append 'temp' value to 'groups'
- iterate through 'groups', transform each element to an array of of its characters
- return the new array
=end

# Solution 1
def slice_when(arr)
  temp = arr[0]
  groups = []

  (0..arr.size - 2).each do |index|
    if temp == arr[index + 1] 
      temp << arr[index + 1]
    else
      groups << temp
      temp = arr[index + 1]
    end
  end

  groups << temp
end

p slice_when(['a', 'a', 'b', 'c', 'd', 'd', 'z', 'a', 'a']).map { |value| value.chars }

# Output
[["a", "a"], ["b"], ["c"], ["d", "d"], ["z"], ["a", "a"]]
```



#### Check if a number is a prime

```ruby
def is_prime?(num)
  return false if num == 1
  (2...num).each do |denominator|
    return false if num.remainder(denominator) == 0
  end
  true
end
```



#### Find nth Fibonacci number

```ruby
def fibonacci(nth)
  first, last = [1, 1]
    
  3.upto(nth) { first, last = [last, first + last] }

  last
end
```



#### Find the longest string (can be adapted to find the largest value)

```ruby
# Solution 1
 longest = ''
   alpha_subs.each do |value|
     if value.size > longest.size
       longest = value
     end
   end
   longest

# Solution 2
alpha_subs.max_by { |sub| sub.length }
```



#### Generate a random number in range

```ruby
rand(20..200)             #=> 69
(20..200).to_a.sample     #=> 69
```



#### Format number to a certain decimal place (result is a String)

```ruby
format('%.2f', 3.456)    #=> '3.45'
```



#### Clean up the words (LS small problems easy 5, problem 5)

```ruby
=begin
Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).
=end

ALPHABET = ('a'..'z').to_a

def cleanup(str)
  clean_chars = []
  str.each_char do |char|
    if ALPHABET.include?(char)
      clean_chars << char
    else
      clean_chars << ' ' unless clean_chars.last == ' '
    end
  end
  clean_chars.join
end

cleanup("---what's my +*& line?") == ' what s my line '
```



#### Create a constant alphabet array

```ruby
ALPHABET = ('a'..'z').to_a + ('A'..'Z').to_a
```

