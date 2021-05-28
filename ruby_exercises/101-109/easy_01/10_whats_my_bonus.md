# 10. What's my Bonus?

Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary. If the boolean is `true`, the bonus should be half of the salary. If the boolean is `false`, the bonus should be `0`.

Examples:

```ruby
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
```

The tests above should print `true`.

**Solution**

```ruby
def calculate_bonus(salary, bonus)
    bonus ? (salary / 2) : 0
end
```

This solution takes advantage of the ternary operator. We're able to use `bonus` as the condition because it's a boolean. If true, divide the `salary` by half, and return the quotient. If false, return `0`.

