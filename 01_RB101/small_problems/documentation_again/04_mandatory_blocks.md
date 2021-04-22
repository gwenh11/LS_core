# 4. Mandatory Blocks

The `Array#bsearch` method is used to search ordered `Array`s more quickly than `#find` and `#select` can. Assume you have the following code:

```ruby
a = [1, 4, 8, 11, 15, 19]
value = a.bsearch { |num| num > 8}
p value
```

How would you search this `Array` to find the first element whose value exceeds `8`?

`Array#bsearch`

bsearch {|x| block } → elem

This signature shows that `#bsearch` takes only one argument - a block - and returns an element of the `Array` to which it is applied. We can also see that the block is required, and that it takes one argument. The text and examples below the signature tell and show us that the block must return `true` or `false` when operating in what is called "find-minimum mode", which is the usual use case.

Putting this all together, we can devise our call to `#bsearch`: we use `a` as the caller, a block of `{ |element| element > 8 }` to find the first element whose value is greater than 8, and we store the return value to a variable named `value`. The value of `value` is then printed, which shows that `#bsearch` found the `11` in `a`.