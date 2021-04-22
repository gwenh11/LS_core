# 6. Keyword Arguments

What does this code print?

```ruby
5.step(to: 10, by: 3) { |value| puts value }
# start at 5, ends at 10, increments by 3 at each iteration
#=> 5 (return nil)
#=> 8 (return nil)
```

`#step` comes from the `Numeric` class, which is basically a superclass of all numeric types. `Math` is a module that supplies a lot of number crunching functionality. `Integer` and `Float` inherit from `Numeric`.

- step(by: step, to: limit) { |i| block } → self
- step(by: step, to: limit) → an_enumerator
- step(limit=nil, step=1) {|i| block } → self
- step(limit=nil, step=1) → an_enumerator

 In this version, `#step` takes two *keyword arguments* (also called *named arguments*), `:by` and `:to` (keyword argument names are symbols). This shows up in our method signature:

- step(by: step, to: limit) { |i| block } → self

The argument named `:by` is a "step" value, while the argument named `:to` is a limit. The text below the signature shows that the "step" value indicates how much to increment the index by with each iteration, while "limit" is the largest value; if the index exceeds this value, the loop exits.

We can also see that `#step` takes a loop in this first form, and that it will execute the block for each value in the iteration.

Given all this information, we can see that the code will print `5` on its first iteration, `8` on the second iteration, and then quit because `11 > 10`

If `to:` and `by:` aren't specified, first argument is limit and defaults to nil, the second argument is the step and defaults to 1.

