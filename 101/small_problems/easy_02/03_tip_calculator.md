# 3. Tip calculator

Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

**Solution**

```ruby
puts "What is the bill?"
bill = gets.chomp.to_f

puts "What is the tip percentage?"
tip_rate = gets.chomp.to_f

tip = (bill * (tip_rate/100)).round(2)
total = (tip + bill).round(2)
puts "The tip is $#{tip}."
puts "The total is $#{total}."
```

#### Further Exploration

Our solution prints the results as `$30.0` and `$230.0` instead of the more usual `$30.00` and `$230.00`. Modify your solution so it always prints the results with 2 decimal places.

Hint: You will likely need `Kernel#format` for this.

Example:

```plaintext
What is the bill? 200
What is the tip percentage? 15

The tip is $30.0
The total is $230.0
```

```ruby
tip = bill * (tip_rate/100)
total = bill + tip
puts "The tip is $#{format('%.2f', tip)}."
puts "The total is $#{format('%.2f', total)}."
```

