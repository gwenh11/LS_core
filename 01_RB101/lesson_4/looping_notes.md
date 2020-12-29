# Controlling a Loop

```ruby
loop do
  number = rand(1..10)   # a random number between 1 and 10
  puts 'Hello!'
  if number == 5
    puts 'Exiting...'
    break
  end
end
```

1. `'Hello!'` is output one or more times
2. `'Exiting...'` is output once

On each iteration:

- `number` is assigned to a random number between `1` and `10`

- `'Hello!'` is output

- The `if` statement checks if `number` is equal to `5`

  - If so `'Exiting...'` is output and `break` is called (which ends the loop)

  - If not then the loop repeats

# Array

```ruby
colors = ['green', 'blue', 'purple', 'orange']
counter = 0

loop do
  break if counter == colors.size
  puts "I'm the color #{colors[counter]}!"
  counter += 1
end

```

Output

```
I'm the color green!
I'm the color blue!
I'm the color purple!
I'm the color orange!
```

