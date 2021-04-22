# 3. Default Arguments in the Middle

Consider the following method and a call to that method:

```ruby
def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)
#=> [4, 5, 3, 6]
```

Use the ruby documentation to determine what this code will print.

This can be found in `doc/syntax/calling_methods.doc` under `Default Positional Arguments`. Ruby lets you use default arguments in the middle of number of positional arguments. Documentation shows that positional arguments are filled out first, then default arguments are set with any values supplied, and finally, default values are applied to anything remaining. 

First, `4` is assigned to `a`, `6` is assigned to `d`. Only arguments with default values remain. Since `5` has not been assigned, it is given to `b` (Ruby fills in missing arguments from left to right) and `c` uses default value `3`.

In other words, `4`, `5` and `6` are assigned to the **positional arguments** `a`, `b`, and `d`. `5` overrides the default value for `b` and `c` takes the default value.