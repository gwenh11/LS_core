# What's wrong with the output?

Josh wants to print an array of numeric strings in reverse numerical order. However, the output is wrong. Without removing any code, help Josh get the expected output.

```ruby
arr = ["9", "8", "7", "10", "11"]
p arr.sort do |x, y|
    y.to_i <=> x.to_i
  end

# Expected output: ["11", "10", "9", "8", "7"] 
# Actual output: ["10", "11", "7", "8", "9"] 
```

**Solution**

```ruby
# Solution 1
p(
  arr.sort do |x, y|
    y.to_i <=> x.to_i
  end
)

# Solution 2
p arr.sort { |x, y| y.to_i <=> x.to_i }
```

This happens due to Ruby's precedence rules. `p` and `arr.sort` binds more tightly than `arr.sort` and the `do...end` block. 

```ruby
(p arr.sort) do |x,y|
  y.to_i <=> x.to_i
end
```

