# 5. Card Deck

We started working on a card game but got stuck. Check out why the code below raises a `TypeError`.

Once you get the program to run and produce a `sum`, you might notice that the sum is off: It's lower than it should be. Why is that?

```ruby
cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards,
         :diamonds => cards,
         :clubs    => cards,
         :spades   => cards }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  remaining_cards.map do |card|
    score(card)
  end

  sum += remaining_cards.sum
end

puts sum
```

**Solution**

On line 34, `remaining_cards` still contain `:jack` instead of its score `10`. When `Array#sum` is invoked on `remaining_cards`, `TypeError` is raised.

This is because on line 30-32 `map` returns a new array with the scores, but we never use that new array. On line 34, `remaining_cards` still references the original array containing both integers and symbols.

The solution is to assign a new array returned by `map` to a variable `score` and invoke `sum` on that array. 

```ruby
scores = remaining_cards.map do |card|
    score(card)
  end

  sum += remaining_cards.scores
```

As for the final sum value, whatever card was picked, it lacks this value on all four suits, not just the one that was picked. On line 24, `pop` mutates `cards`. We reference the same `cards` in each key of the `deck` hash, so `deck` is affected by the mutation. 

The most straightforward solution is to clone the `cards` array when adding it to the deck on lines 3-6.

```ruby
deck = { :hearts   => cards.clone,
         :diamonds => cards.clone,
         :clubs    => cards.clone,
         :spades   => cards.clone }
```

