# SUIT_NAMES = { 'H' => 'Hearts', 'D' => 'Diamonds', 'C' => 'Clubs', 'S' => 'Spades'}
# VALUE_NAMES = { 'J' => 'Jack', 'Q' => 'Queen', 'K' => 'King', 'A' => 'Ace' }
# VALID_REPLAY = %w(n no y yes)


# def initialize_deck
#   values = ('2'..'10').to_a + VALUE_NAMES.keys
#   SUIT_NAMES.keys.product(values)
# end

# def deal_one_card(card_hand)
#   card_hand << [SUIT_NAMES.keys.sample, VALUES.sample]
# end

# def deal_initial_cards(card_hand)
#   2.times { deal_one_card(card_hand) }
# end

# def count_cards(card_hand)
#   cards = []
#   card_hand.each do |card|
#     suit = SUIT_NAMES[card[0]]
#     if VALUE_NAMES.include?(card[1])
#       value = VALUE_NAMES[card[1]]
#     else
#       value = card[1]
#     end
#     cards << "#{value} of #{suit}"
#   end
#   cards.join(', ')
# end

# def display_all_hands(player_hand, dealer_hand)
#   player_cards = count_cards(player_hand)
#   dealer_cards = count_cards(dealer_hand)
#   puts "Dealer has: #{dealer_cards}"
#   puts "You have: #{player_cards}"
# end

# def total(card_hand)
#   values = card_hand.map { |card| card[1] }

#   sum = 0
#   values.each do |value|
#     if value == "A"
#       sum += 11
#     elsif value.to_i == 0 # J, Q, K
#       sum += 10
#     else
#       sum += value.to_i
#     end
#   end

#   values.select { |value| value == 'A' }.count.times do
#     sum -= 10 if sum > 21
#   end
#   sum
# end

# def display_hand_value(total_card_value)
#   puts "Total card value are #{total_card_value} points"
# end

# def player_turn(player_hand, dealer_hand)
#   answer = nil
#   player_points = 0
#   loop do
#     puts ''
#     puts 'Hit or stay?'
#     answer = gets.chomp.downcase
#     if answer == 'hit'
#       puts "You chose to hit!"
#       deal_one_card(player_hand)
#       display_all_hands(player_hand, dealer_hand)
#       player_points = total(player_hand)
#       display_hand_value(player_points)
#     end
#     break if answer == 'stay' || busted?(player_points)
#   end

#   if busted?(player_points)
#     puts "You are busted. You lost the game."
#     player_points = nil
#   else
#     puts "You chose to stay!"
#   end
#   player_points
# end

# def busted?(total_card_value)
#   total_card_value > 21
# end

# def dealer_turn(player_hand, dealer_hand)
#   answer = nil
#   dealer_points = total(dealer_hand)
#   loop do
#     break if dealer_points >= 17
#     puts ''
#     puts 'Hit or stay?'
#     puts 'Dealer chose to hit!'
#     deal_one_card(player_hand)
#     display_all_hands(player_hand, dealer_hand)
#     dealer_points = total(dealer_hand)
#     display_hand_value(dealer_points)
#   end
#   puts 'Dealer chose to stay!'
#   dealer_points
# end

# def player_replay
#   puts 'Would you like to play again?'
#   answer = nil
#   loop do
#     answer = gets.chomp.downcase
#     break if VALID_REPLAY.include?(answer)
#     puts 'Sorry. That is not a valid answer!'
#   end
#   answer
# end

# loop do
#   deck = initialize_deck
#   player_hand = []
#   dealer_hand = []
#   # player_points = total(player_hand)
#   # card_hand << deal_one_card
#   deal_initial_cards(player_hand)
#   deal_initial_cards(dealer_hand)
#   display_all_hands(player_hand, dealer_hand)
#   player_points = player_turn(player_hand, dealer_hand)
#   if player_points == nil
#     replay_choice = player_replay
#     break if VALID_REPLAY[0, 1].include?(replay_choice)
#   end
#   dealer_points = dealer_turn(player_hand, dealer_hand)
#   if dealer_points > player_points
#     puts 'Dealer won!'
#   else
#     puts 'You won!'
#   end
#   replay_choice = player_replay
#   break if VALID_REPLAY[0, 1].include?(replay_choice)
# end

require 'pry'
SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
NON_NUMBER_VALUES = ['Jack', 'Queen', 'King', 'Ace']
NUMBER_VALUES = ('2'..'10')
DEALER_MIN = 17
WINING_TOTAL = 21
GRAND_WINNER_SCORE = 5
GAME_CHOICES = %w(h s hit stay)
REPLAY_CHOICES = %w(n y no yes)


def clear_screen
  system('clear') || system('cls')
end

def pace_interaction
  sleep(2)
end

def pause_for_player
  prompt "Press ENTER to continue."
  gets
  nil
end

def add_new_line
  puts ''
end

def joinand(arr, delimiter1=', ', delimiter2='and')
  return arr.join(" #{delimiter2} ") if arr.size < 3
  arr[-1] = "#{delimiter2} #{arr.last}"
  arr.join(delimiter1)
end

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  values = NUMBER_VALUES.to_a + NON_NUMBER_VALUES
  SUITS.product(values).shuffle
end

def deal_one_card(deck, cards)
  cards << deck.pop
end

def count_cards(card_hand)
  cards = []
  card_hand.each do |card|
    cards << "#{card[1]} of #{card[0]}"
  end
  joinand(cards)
end



def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == 'Ace'
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.select { |value| value == 'Ace' }.count.times do
    sum -= 10 if sum > WINING_TOTAL
  end
  
  sum
end

def busted?(cards_total)
  cards_total > WINING_TOTAL
end

def initial_deal(deck, dealer_cards, player_cards)
  2.times do
    deal_one_card(deck, player_cards)
    deal_one_card(deck, dealer_cards)
  end

  [total(dealer_cards), total(player_cards)]
end

def player_turn(deck, player_cards, player_total)
  loop do
    answer = nil
    # check for valid input
    loop do
      prompt "Would you like to (h)it or (s)stay?"
      answer = gets.chomp.downcase
      break if GAME_CHOICES.include?(answer)
      prompt "Sorry, must enter 'h' or 's'."
    end

    if answer.start_with?('h')
      deal_one_card(deck, player_cards)
      player_total = total(player_cards)
      prompt "You chose to hit!"
      pace_interaction
      prompt "Your cards are now: #{count_cards(player_cards)}"
      pace_interaction
      prompt "Your total is now: #{player_total}"
    end
    break if answer.start_with?('s') || busted?(player_total)
  end

  pace_interaction
  if busted?(player_total)
    prompt "Your total is greater than #{WINING_TOTAL}..."
  else
    prompt "You stayed at #{player_total}"
  end

  player_total
end

def dealer_turn(deck, dealer_cards, dealer_total)
  pace_interaction
  prompt "Dealer turn..."
  pace_interaction

  loop do
    dealer_total = total(dealer_cards)
    break if dealer_total >= DEALER_MIN

    prompt "Dealer hits!"
    deal_one_card(deck, dealer_cards)
    pace_interaction
    prompt "Dealer's cards are now: #{count_cards(dealer_cards)}"
  end

  pace_interaction
  prompt "Dealer stays at #{dealer_total}" unless busted?(dealer_total)
  dealer_total
end

def display_all_hands(player_cards, dealer_cards, player_total, dealer_total)
  pace_interaction
  add_new_line
  player_hand = count_cards(player_cards)
  if dealer_cards.count < 3
    dealer_hand = count_cards([dealer_cards[0]])
    prompt "Dealer has #{dealer_hand} and ?"
    # binding.pry
  else
    dealer_hand = count_cards(dealer_cards)
    prompt "Dealer has #{dealer_hand}, for a total of: #{dealer_total}"
  end
  prompt "Player has #{player_hand}, for a total of: #{player_total}"
  add_new_line
end

def detect_result(dealer_total, player_total)

  if player_total > WINING_TOTAL
    :player_busted
  elsif dealer_total > WINING_TOTAL
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(result, dealer_total, player_total)
  pace_interaction
  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def calculate_score(result, score)
  case result
  when :player_busted then score[:dealer] +=1
  when :dealer_busted then score[:player] += 1
  when :player then score[:player] += 1
  when :dealer then score[:dealer] += 1
  end
end

def grand_winner?(score)
  score.values.any? { |value| value == GRAND_WINNER_SCORE }
end

def display_score(score)
  pace_interaction
  puts "=============="
  prompt "Dealer score is: #{score[:dealer]}"
  prompt "Your score is: #{score[:player]}"
  puts "=============="
end

def display_grand_winner(score)
  grand_winner = score.key(GRAND_WINNER_SCORE)
  pace_interaction
  prompt "The grand winner is #{grand_winner}"
end

def play_again?
  pace_interaction
  add_new_line
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp.downcase
  answer.start_with?('y')
end

def play_one_round(round, score, deck)
  clear_screen
  prompt "ROUND ##{round}"
  player_cards = []
  dealer_cards = []

  # initial deal
  
  dealer_total, player_total = initial_deal(deck, player_cards, dealer_cards)

  display_all_hands(player_cards, dealer_cards, player_total, dealer_total)


  player_total = player_turn(deck, player_cards, player_total)

  unless busted?(player_total)
    dealer_total = dealer_turn(deck, dealer_cards, dealer_total)
  end

  
  display_all_hands(player_cards, dealer_cards, player_total, dealer_total)
  result = detect_result(dealer_total, player_total)
  display_result(result, dealer_total, player_total)
  calculate_score(result, score)
  display_score(score)
  pause_for_player
end

def play_one_game
  deck = initialize_deck
  score = { player: 0, dealer: 0 }
  round = 1
  loop do
    play_one_round(round, score, deck)
    break if grand_winner?(score)
    round += 1
  end
  display_grand_winner(score)
end

loop do
  

  

  play_one_game
  break unless play_again?
end

prompt "Thank you for playing Twenty-One! Good bye!"
