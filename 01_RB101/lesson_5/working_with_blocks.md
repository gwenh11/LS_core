# Working with Blocks

**Some important things to remember:**

- **If at first code appears opaque or complex, take the time to break it down step by step.**
- **If necessary use some sort of systematic approach (such as the tabular method outlined in this assignment).**
- **Figure out what is happening at each step, paying particular attention to:**
  - **Return value**
  - **Side effects**
- **Pay attention to the return values of all statements in your code, especially where implicit return values are being relied on.**
- **Make sure you have a clear understanding of the underlying concepts such as data structure, loops, iterative methods and the blocks passed to them (go back over earlier assignments if necessary).**
- **Be clear about the method implementation of the iterative method(s) being used, especially:**
  - **What values are passed to the block**
  - **What the method does with the return value of the block**



**When breaking down the example, pay close attention to:**

- **The return value of the block**
- **The return value of the method**
- **Any side-effects**

**When determining what these return values will be it's important to understand how the method used in the example actually works.**

#### Example 1

Take a moment to digest the following example:

```ruby
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]
```

What's happening in this, seemingly simple, piece of code? Take it apart and try to describe every interaction with precision.

The `Array#each` method is being called on the multi-dimensional array `[[1, 2], [3, 4]]`. Each inner array is passed to the block in turn and assigned to the local variable `arr`. The `Array#first` method is called on `arr` and returns the object at index `0` of the current array - in this case the integers `1` and `3`, respectively. The `puts` method then outputs a string representation of the integer. `puts` returns `nil` and, since this is the last evaluated statement within the block, the return value of the block is therefore `nil`. `each` doesn't do anything with this returned value though, and since the return value of `each` is the calling object - in this case the nested array `[[1, 2], [3, 4]]` - this is what is ultimately returned.

That's a lot of stuff going on in just three lines of code! It's pretty difficult to parse all of that in your head at once, and this is a relatively simple example (we'll look at some much more complex ones later in this assignment). It can be helpful to map things out visually in order to keep track of what is going on.

What specific pieces of information are we interested in keeping track of? When evaluating code like this, ask the following questions:

- What is the type of action being performed (method call, block, conditional, etc..)?
- What is the object that action is being performed on?
- What is the side-effect of that action (e.g. output or destructive action)?
- What is the return value of that action?
- Is the return value used by whatever instigated the action?

We can take these pieces of information and set them out in a tabular format:

| Line | Action                | Object                          | Side Effect                                 | Return Value                    | Is Return Value Used?                        |
| :--: | :-------------------- | :------------------------------ | :------------------------------------------ | :------------------------------ | :------------------------------------------- |
|  1   | method call (`each`)  | The outer array                 | None                                        | The calling object              | No, but shown on line 6                      |
| 1-3  | block execution       | Each sub-array                  | None                                        | `nil`                           | No                                           |
|  2   | method call (`first`) | Each sub-array                  | None                                        | Element at index 0 of sub-array | Yes, used by `puts`                          |
|  2   | method call (`puts`)  | Element at index 0 of sub-array | Outputs string representation of an Integer | `nil`                           | Yes, used to determine return value of block |

#### Example 2

Let's take a look at another example.

```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
end
# 1
# 3
# => [nil, nil]
```

This example is very similar to the previous example except with one slight variation: `each` is replaced with `map`. At first this may seem like an insignificant change, but when you take a closer look you'll notice the return value of the example is significantly different.

Let's break down this example to see if we can understand the difference:

| Line | Action                | Object                               | Side Effect                                   | Return Value                    | Is Return Value Used?                        |
| :--: | :-------------------- | :----------------------------------- | :-------------------------------------------- | :------------------------------ | :------------------------------------------- |
|  1   | method call (`map`)   | The outer array                      | None                                          | New array `[nil, nil]`          | No, but shown on line 6                      |
| 1-3  | block execution       | Each sub-array                       | None                                          | `nil`                           | Yes, used by `map` for transformation        |
|  2   | method call (`first`) | Each sub-array                       | None                                          | Element at index 0 of sub-array | Yes, used by `puts`                          |
|  2   | method call (`puts`)  | Element at index 0 of each sub-array | Outputs a string representation of an Integer | `nil`                           | Yes, used to determine return value of block |

We can see that the change is a result of how `map` handles the return value of the block. Unlike `each`, `map` performs transformation based on the return value of the block. This means the last line in the block -- in this case, `puts` -- is critical to understanding this code.

#### Example 3

Let's mix it up a little bit and have you try taking apart an example on your own.

```ruby
[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end
# 1
# 3
#=> [1, 3]
```

Map out a detailed breakdown for the above example using the same approach as the previous two examples. What do you think will be returned and what will be the side-effects? You shouldn't have to guess; there is a right answer and you have all the knowledge necessary to take it apart. Take your time and be careful. Check the solution below once you have done this on your own.

| Line | Action              | Object                                | Side Effect                                  | Return Value                    | Is Return Value Used?                                |
| ---- | ------------------- | ------------------------------------- | -------------------------------------------- | ------------------------------- | ---------------------------------------------------- |
| 1    | method call `map`   | the outer array                       | none                                         | new array                       | no, but shown on line 7                              |
| 1-4  | block execution     | each sub-array                        | none                                         | integer at index 0 of sub-array | yes, used by `map` for transformation                |
| 2    | method call `first` | each sub-array                        | none                                         | integer at index 0 of sub-array | yes, used by `puts`                                  |
| 2    | method call `puts`  | integer at index 0 of each sub-array  | output a string representation of an Integer | `nil`                           | no                                                   |
| 3    | method call `first` | integer at index 0 for each sub-array | none                                         | integer at index 0 of sub-array | yes, used to determine the return value of the block |



#### Example 4

Here's another example.

```ruby
my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end
# 18
# 7
# 12
# => [[18, 7], [3, 12]]
```

Can you take this code apart, just like before? What will be output and what will be the value of `my_arr`? Check the solution below once you have tried this on your own.

| Line | Action                | Object                                    | Side Effect                                  | Return Value                                       | Is Return Value Used?                                        |
| ---- | --------------------- | ----------------------------------------- | -------------------------------------------- | -------------------------------------------------- | ------------------------------------------------------------ |
| 1    | variable assignment   | n/a                                       | none                                         | `[[18, 7], [3, 12]]`                               | no                                                           |
| 1    | method call `each`    | `[[18, 7], [3, 12]]`                      | none                                         | the calling object: `[[18, 7], [3, 12]]`           | yes, used by variable assignment to `my_arr`                 |
| 1-7  | outer block execution | each sub-array                            | none                                         | each sub-array                                     | no                                                           |
| 2    | method call `each`    | each sub-array                            | none                                         | the calling object: sub-array in current iteration | yes, used to determine the return value of outer block       |
| 2-6  | inner block execution | element of sub-array in current iteration | none                                         | `nil`                                              | no                                                           |
| 3    | comparison `>`        | element of sub-array in current iteration | none                                         | Boolean                                            | yes, evaluated by `if`                                       |
| 3-5  | conditional `if`      | the result of the expression `num > 5`    | none                                         | `nil`                                              | yes, used to determine the return value of inner block       |
| 4    | method call `puts`    | element of sub-array in current iteration | output a string representation of an Integer | `nil`                                              | yes, used to determine the return value of the conditional statement if the condition is met |

There are 4 return values to pay attention to here: the return value of both calls to `each` and the return value of both blocks. **When determining what these return values will be it's important to understand how the method used in the example actually works.** In this case we're using `each`, which ignores the return value of the block. This lets us quickly see that the value of `my_arr` will be the array that `each` was called on.

**Because `each` ignores the block's return value, this was a relatively straight forward example.**

#### Example 5

Next, let's tackle a slightly more complex example.

```ruby
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end
# => [[2, 4], [6, 8]]
```

What will the return value be in this example? Use what you've learned so far to break it down on your own before checking the solution below.

| Line | Action                                        | Object                        | Side Effect | Return Value | Is Return Value Used?                                  |
| ---- | --------------------------------------------- | ----------------------------- | ----------- | ------------ | ------------------------------------------------------ |
| 1    | method call `map`                             | `[[1, 2], [3, 4]]`            | none        | new array    | no                                                     |
| 1-5  | outer block execution                         | each sub-array                | none        | new array    | yes, used by top-level `map` for transformation        |
| 2    | method call `map`                             | each sub-array                | none        | new array    | yes, used to determine the outer block's return value  |
| 2-4  | inner block execution                         | element within each sub-array | none        | an Integer   | yes, used by inner `map` for transformation            |
| 3    | method call `*` with integer 2 as an argument | element within each sub-array | none        | an Integer   | yes, used to determine the return value of inner block |

If you look closely and try to understand every line of code, there are actually more than 4 return values you need to pay attention to. By now, you should be starting to realize that the **return value of every expression is important**. 

#### Example 6

Let's mix it up now with some variation. In the below example, we have an array of hashes, and we want to select all elements where every key matches the first letter of the value. Note that the keys are symbols here, so we'll have to do some conversion before comparison.

```ruby
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]
```

There's a lot going on here, but you now possess all the necessary knowledge to take this apart, line by line, letter by letter. We won't do a full table of steps like before, but see if you understand every line and every letter in the code above. If you do not, take your time and study it; you should be able to deconstruct this code to its core.

| Line | Action                | Object                                               | Side Effect | Return Value                    | Is Return Value Used?                                      |
| ---- | --------------------- | ---------------------------------------------------- | ----------- | ------------------------------- | ---------------------------------------------------------- |
| 1    | method call `select`  | `[{ a: 'ant', b: 'elephant' }, { c: 'cat' }]`        | none        | new array                       | no                                                         |
| 1-5  | outer block execution | each hash within array                               | none        | new array                       | yes, used by top-level `select` for selection              |
| 2    | method call `all?`    | each hash within array                               | none        | Boolean                         | yes, used to determine the outer block's return value      |
| 2-4  | inner block execution | each key-value pair within hash in current iteration | none        | Boolean                         | yes, used by inner `all?`                                  |
| 3    | method call `to_s`    | key within hash in current iteration                 | none        | Symbol representation of string | yes, used by comparison `==`                               |
| 3    | method call `[]`      | value within hash in current iteration               | none        | character at index 0 of string  | yes, used by comparison `==`                               |
| 3    | comparison `==`       | key-value within hash in current iteration           | none        | Boolean                         | yes, used to determine the return value of the inner block |

The first thing to notice here is the use of the `all?` method within the `select` block. Since `#select` specifically cares about the *truthiness* of the block's return value, using a method that returns a boolean works well. `all?` will return `true` if the block passed to it never returns a value of `false` or `nil` for every key/value pair in the hash. We're using `value[0] == key.to_s` to test whether all keys match the first letter of all their associated values. Note that the only hash that meets this criteria is `{:c => 'cat'}`, and the return value is an array.

What would happen if, instead of using `all?`, we used `any?`. Why would this affect the return value of `select`? `any?` returns true if the block passed to it returns `true` for any key/value pair in the hash. Therefore, the return value of `select` is a new array that is the same as the calling object.

#### Example 7

Sorting nested data structures can be tricky, and it is important to be clear about the level at which you are sorting and which values you want to use to order your collection.

Say for example we have an array of nested arrays which contain numeric strings, and we want to sort the outer array so that the inner arrays are ordered according to the *numeric* value of the strings they contain. Take, for example, the following 4-element array of arrays.

```ruby
arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]
```

We know that we want to sort at the level of the outer array, but we can't simply call `sort` on it. When sorting nested arrays it is important to understand that there are **two** sets of comparison happening:

1. Each of the inner arrays is compared with the other inner arrays.
2. The way those arrays are compared is by comparing the *elements* within them ([the documentation](http://ruby-doc.org/core/Array.html#method-i-3C-3D-3E) refers to this as comparing in an 'element-wise' manner)

array <=> other_array → -1, 0, or 1

Returns -1, 0, or 1 as `self` is less than, equal to, or greater than `other_array`. For each index `i` in `self`, evaluates `result = self[i] <=> other_array[i]`.

Returns -1 if any result is -1:

```
[0, 1, 2] <=> [0, 1, 3] # => -1
```

Returns 1 if any result is 1:

```
[0, 1, 2] <=> [0, 1, 1] # => 1
```

When all results are zero:

- Returns -1 if `array` is smaller than `other_array`:

  ```
  [0, 1, 2] <=> [0, 1, 2, 3] # => -1
  ```

- Returns 1 if `array` is larger than `other_array`:

  ```
  [0, 1, 2] <=> [0, 1] # => 1
  ```

- Returns 0 if `array` and `other_array` are the same size:

  ```
  [0, 1, 2] <=> [0, 1, 2] # => 0
  ```

Because the elements in the arrays are strings, by calling `sort` it is string order which will ultimately determine array order:

```ruby
arr.sort # => [["1", "8", "11"], ["1", "8", "9"], ["2", "12", "15"], ["2", "6", "13"]]
```

Since strings are compared character by character this doesn't give us a *numerical* comparison. In order to achieve this we have to perform some transformation on the inner arrays prior to comparing them.

```ruby
arr.sort_by do |sub_arr|
  sub_arr.map do |num|
    num.to_i
  end
end
# => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]
```

What is happening here?

The key here is understanding that when we carry out transformation within a `sort_by` block, the transformed elements are what are then used to perform the comparison. As long as what is returned by the block is comparable, we can perform whatever transformation we need to within the block - including nesting other method calls within it.

In this case, each time the top-level block is called, we call `map` on the sub-array for that iteration, within the `map` block we call `to_i` on each string within that particular sub-array, which returns a new array with integers and leaves the original sub-array unmodified. This ends up sorting the outer array by comparing the transformed integers in the inner arrays, which is what we're looking to do, without any side effects.

#### Example 8

It can be tricky to work with different objects in a nested array if you want to only select nested elements based on certain criteria. For example, take the 2-element array below, where we only want to select integers greater than 13 but strings less than 6 characters. The trick here is that the elements are in a two layer nested array data structure.

```ruby
[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item    # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end
# => [[27], ["apple"]]
```

At first you might think to reach for the `select` method to perform selection, but since we're working with a nested array, that won't work. We first need to access the nested arrays before we can select the value we want. In order to select the specified values in the requirement, we need to first determine if an element is an integer; there are lots of ways to do this, we just went with the imperfect `item.to_s.to_i == item` test.

One of the main reasons `map` is used in this example is not only to iterate over the array and access the nested arrays, but to return a new array containing the selected values. If we used `each` instead we wouldn't have the desired return value, and would need an extra variable to collect the desired results.

#### Example 9

This example contains a triple-level nested array. Take your time and try to break down each component. Hint: the top-level array is a 2-element array.

```ruby
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
# => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]
```

The key things to focus on with this example is understanding how each method works and the return value of the block. There are a total of 6 places where a return occurs: 3 methods (`map`, `each`, and `partition`) and 3 blocks (one for each method). By looking at the example, you should notice the first method call within `map` is `each`. If we understand `each`, we know that it doesn't care about the block's return value and it always returns the calling object. Therefore, just by looking at line 2, we can already say that the return value of `map` will be a new array that matches the value of the calling object. In this example, that's really all the interesting behavior there is as there are no side effects deeper in the code.

#### Example 10

Let's say we have the following data structure of nested arrays and we want to increment every number by 1 without changing the data structure.

```ruby
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end
# => [[[2, 3], [4, 5], [6, 7]]
```

This example is more complicated than the rest, but at this point you should be able to break it down effectively. Use the tools you've learned about in this lesson and take as much time as needed. Work on breaking down each component and understanding the return value of each expression. What will be the final return value? Check the solution only after you've tried this on your own.

The tricky part about this example is that the original array has uneven nested levels. If we want to add `1` to each value we first need to find a way to access those values, regardless of how many arrays they're nested in. To do this, we determine if the current element is an array or an integer and then execute the appropriate code.

`map` is a good choice for this task because it returns a new array containing transformed values. This way we can ultimately return a new array with the same nested levels as the original.

In practice, this type of nested data processing is typically a sign of bad design. But if you ever find yourself in that situation, you should be confident in your ability to work through it.

#### Mutating Collections While Iterating

One last thing before ending this assignment. *Do not mutate the collection that you're iterating through.* Since iteration is the basis of selection and transformation, that implies don't mutate the collection while you're performing selection or transformation or pretty much any action on the collection.

Here's an example of what not to do:

```ruby
# The method remove_evens! should delete all even numbers from the array passed in as the argument.

def remove_evens!(arr)
  arr.each do |num|
    if num % 2 == 0
      arr.delete(num)
    end
  end
  arr
end

p remove_evens!([1,1,2,3,4,6,8,9])
# expected return value [1, 1, 3, 9]
# actual return value [1, 1, 3, 6, 9]
```

The `Array#delete` method is destructive, and is changing the contents of `arr` during iteration. The return value here may or may not make some sense to you, but there's almost always a much clearer way of achieving the desired result without having to resort to mutating the collection while iterating through it. We won't go into detail and explain why this code does what it does, because it's not something we want you to get good at.

One way you could fix the code above is to create a shallow copy of the array and iterate through it while mutating the original array.

```ruby
def remove_evens!(arr)
  cloned_arr = arr.dup
  cloned_arr.each do |num|
    if num % 2 == 0
      arr.delete(num)
    end
  end
  arr
end
```