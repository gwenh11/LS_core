# Practice Problems: Methods and More Methods

Now that we've explored a handful of methods and looked at how they work, let's do a few practice problems to help drive home the concepts we learned about in the last two assignments.

The goal for these practice problems is to gain a deep understanding of specific concepts, not to rush through them. Do your best to answer the questions without running the example code. You should be able to determine the answers just by looking at the code or by referring to the Ruby docs.

#### Practice Problem 1

What is the return value of the `select` method below? Why?

```ruby
[1, 2, 3].select do |num|
  num > 5
  'hi'
end
#=> Return value: [1, 2, 3]
```

The last line of code executed of the block is `'hi'`, which is always truthy. `select` returns a new array containing all of the elements in the original array. 

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#### Practice Problem 2

How does `count` treat the block's return value? How can we find out?

```ruby
['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
#=> Return value: 2
```

Similar to `select`, `count` considers the *truthiness* of the block's return value. `count` only counts element if the block's return value evaluates to `true`. From ruby docs: With no argument and a block given, calls the block with each element; return the count of elements for which the block returns a truthy value. 

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#### Practice Problem 3

What is the return value of `reject` in the following code? Why?

```ruby
[1, 2, 3].reject do |num|
  puts num
end
#=> Output: 1
#=> Output: 2
#=> Output: 3
#=> Return value: [1, 2, 3]
```

Remove elements for which the block returns a truthy value. In this case, the block return value is `nil`. Therefore, a new array is returned and contains all the elements in the original array. 

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#### Practice Problem 4

What is the return value of `each_with_object` in the following code? Why?

```ruby
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
#=> Return value: {'a' => 'ant', 'b' => 'bear', 'c' => 'cat'}
```

When we invoke `each_with_object`, `{}` is passed as an argument and then passed into the block. After each iteration, the object value is updated. Once `each_with_object` has iterated over the calling collection, it returns the initially given object, which now contains all the updates. 

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#### Practice Problem 5

What does `shift` do in the following code? How can we find out?

```ruby
hash = { a: 'ant', b: 'bear' }
hash.shift
#=> Return value: [a, 'ant']
```

Remove a key-value pair from hash and return it as the two-item [key, value] or the hash's default value if the hash is empty. This method mutates the hash it calls upon. 

-------------------------------------------------------------------------------------------------------------------------

#### Practice Problem 6

What is the return value of the following statement? Why?

```ruby
['ant', 'bear', 'caterpillar'].pop.size
#=> Return value: 11
```

`pop` removes the last element of the array and returns it (`'caterpillar'`). `size` is being called upon the return value by `pop` (`'caterpillar'`). The return value is now is `11` because `'caterpillar'` has `11` characters. 

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#### Practice Problem 7

What is the **block**'s return value in the following code? How is it determined? Also, what is the return value of `any?` in this code and what does it output?

```ruby
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
#=> Output: 1
#=> Return value: true
```

The return value of the block is determined by the return value of the last expression within the block. `num.odd?` returns a boolean. It returns `true`  on the first iteration, so `any?` returns true. `any?` stops iterating after this point and `puts num` is executed once. 

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#### Practice Problem 8

How does `take` work? Is it destructive? How can we find out?

```ruby
arr = [1, 2, 3, 4, 5]
arr.take(2)
#=> Return value: [1, 2]
```

Returns a new array that contains the first `n` (passed as an argument) from the array. If a negative number is given, raises an `ArgumentError`.

#### Practice Problem 9

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

What is the return value of `map` in the following code? Why?

```ruby
{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
#=> Return value: [nil, 'bear']
```

`map` always return an array. On the first iteration, conditional evaluates to `false` because `'ant'` has a length less than `3`. Therefore, `value` isn't return, which results in `nil` as the first element of the return array. On the second iteration, conditional evaluates to `true`, `value` is returned, which results in `'bear'` added to the return array.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#### Practice Problem 10

What is the return value of the following code? Why?

```ruby
[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
#=> Return value: [1, nil. nil]
```

On the first iteration, `if` conditional evaluates to `false`, `num` is returned. On the second iteration `if` conditional evaluates to `true`, `puts num` returns `nil`. Therefore, `nil` is added to the return array. Similar execution happens on the third iteration. 