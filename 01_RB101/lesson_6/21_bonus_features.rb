SUIT_NAMES = { 'H' => 'Hearts', 'D' => 'Diamonds', 'C' => 'Clubs', 'S' => 'Spades'}
VALUE_NAMES = { 'J' => 'Jack', 'Q' => 'Queen', 'K' => 'King', 'A' => 'Ace' }
VALUES = ('2'..'10').to_a + VALUE_NAMES.keys
VALID_REPLAY = %w(n no y yes)


def initialize_deck
  SUIT_NAMES.transform_values { VALUES }
end

def deal_one_card(card_hand)
  card_hand << [SUIT_NAMES.keys.sample, VALUES.sample]
end

def deal_initial_cards(card_hand)
  2.times { deal_one_card(card_hand) }
end

def count_cards(card_hand)
  cards = []
  card_hand.each do |card|
    suit = SUIT_NAMES[card[0]]
    if VALUE_NAMES.include?(card[1])
      value = VALUE_NAMES[card[1]]
    else
      value = card[1]
    end
    cards << "#{value} of #{suit}"
  end
  cards.join(', ')
end

def display_card_hand(player_hand, dealer_hand)
  player_cards = count_cards(player_hand)
  dealer_cards = count_cards(dealer_hand)
  puts "Dealer has: #{dealer_cards}"
  puts "You have: #{player_cards}"
end

def total(card_hand)
  values = card_hand.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > 21
  end
  sum
end

def display_hand_value(total_card_value)
  puts "Total card value are #{total_card_value} points"
end

def player_turn(player_hand, dealer_hand)
  answer = nil
  player_points = 0
  loop do
    puts ''
    puts 'Hit or stay?'
    answer = gets.chomp.downcase
    if answer == 'hit'
      puts "You chose to hit!"
      deal_one_card(player_hand)
      display_card_hand(player_hand, dealer_hand)
      player_points = total(player_hand)
      display_hand_value(player_points)
    end
    break if answer == 'stay' || busted?(player_points)
  end

  if busted?(player_points)
    puts "You are busted. You lost the game."
    player_points = nil
  else
    puts "You chose to stay!"
  end
  player_points
end

def busted?(total_card_value)
  total_card_value > 21
end

def dealer_turn(player_hand, dealer_hand)
  answer = nil
  dealer_points = total(dealer_hand)
  loop do
    break if dealer_points >= 17
    puts ''
    puts 'Hit or stay?'
    puts 'Dealer chose to hit!'
    deal_one_card(player_hand)
    display_card_hand(player_hand, dealer_hand)
    dealer_points = total(dealer_hand)
    display_hand_value(dealer_points)
  end
  puts 'Dealer chose to stay!'
  dealer_points
end

def player_replay
  puts 'Would you like to play again?'
  answer = nil
  loop do
    answer = gets.chomp.downcase
    break if VALID_REPLAY.include?(answer)
    puts 'Sorry. That is not a valid answer!'
  end
  answer
end

loop do
  deck = initialize_deck
  player_hand = []
  dealer_hand = []
  # player_points = total(player_hand)
  # card_hand << deal_one_card
  deal_initial_cards(player_hand)
  deal_initial_cards(dealer_hand)
  display_card_hand(player_hand, dealer_hand)
  player_points = player_turn(player_hand, dealer_hand)
  if player_points == nil
    replay_choice = player_replay
    break if VALID_REPLAY[0, 1].include?(replay_choice)
  end
  dealer_points = dealer_turn(player_hand, dealer_hand)
  if dealer_points > player_points
    puts 'Dealer won!'
  else
    puts 'You won!'
  end
  replay_choice = player_replay
  break if VALID_REPLAY[0, 1].include?(replay_choice)
end
