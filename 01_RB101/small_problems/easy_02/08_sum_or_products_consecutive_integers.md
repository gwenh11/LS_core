# 8. Sum or Product of Consecutive Integers

Write a program that asks the user to  enter an integer greater than 0, then asks if the user wants to  determine the sum or product of all numbers between 1 and the entered  integer.

Examples:

```plaintext
>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.


>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.
```

#### Further Exploration

The `compute_sum` and `compute_product` methods are simple and should be familiar. A more rubyish way of computing sums and products is with the `Enumerable#inject` method.  `#inject` is a very useful method, but if you've never used it before, it can be difficult to understand.

Take some time to read the documentation for `#inject`. (Note that all `Enumerable` methods can be used on Array.) Try to explain how it works to yourself.

Try to use `#inject` in your solution to this problem.

**Solution**

```ruby
def valid_integer?(input)
    input.to_i.to_s == input && input.to_i > 0
end

def calculate_sum(number)
    (1..number).inject { |sum, n| sum + n}
    # total = 0
    # 1.upto(number) { |value| total += value}
	# total
end

def calculate_product(number)
    (1..number).inject { |product, n| product * n}
end

puts ">> Please enter an integer greater than 0:"
num = nil
loop do
    num = gets.chomp
    break if valid_integer?(num)
    puts ">> Not a valid input. Please re-enter."
end

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
choice = nil
loop do
    choice = gets.chomp
    break if %(s p).include?(choice)
    puts ">> Not a valid choice. Please re-enter."
end

if choice == 's' 
    result = calculate_sum(num.to_i)
    operation = 'sum'
else
    result = calculate_product(num.to_i)
    operation = 'product'
end

puts ">> The #{operation} of the integers between 1 and #{num} is #{result}"
```

