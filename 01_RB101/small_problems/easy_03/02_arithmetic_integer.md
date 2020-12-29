# 2. Arithmetic Integer

Write a program that prompts the user for two positive integers, and then prints the results of the following  operations on those two numbers: addition, subtraction, product,  quotient, remainder, and power. Do not worry about validating the input.

Example

```plaintext
==> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103
```

**Solution**

```ruby
OPS = %w(+ - * / % **)
results = []

puts "==> Enter the first number:"
num1 = gets.chomp.to_i

puts "==> Enter the second number:"
num2 = gets.chomp.to_i

results << num1 + num2
results << num1 - num2
results << num1 * num2
results << num1 / num2
results << num1 % num2
results << num1 ** num2

limit = operations.size - 1

0.upto(limit) do |value|
  puts "==> #{num1} #{OPS[value]} #{num2} = #{results[value]}"
end
```

**Refactor using method `#reduce`**

```ruby
OPS = %w(+ - * / % **)

puts "==> Enter the first number:"
num1 = gets.chomp.to_i

puts "==> Enter the second number:"
num2 = gets.chomp.to_i

OPS.each do |operator|
  total = [num1, num2].reduce(operator.to_sym)
  puts "==> #{num1} #{operator} #{num2} = #{total}"
end
```

