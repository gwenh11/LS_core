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

If `to:` and `by:` aren't specified, first argument is limit and defaults to nil, the second argument is the step and defaults to 1.

