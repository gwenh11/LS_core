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

# def display_card_hand(player_hand, dealer_hand)
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
#       display_card_hand(player_hand, dealer_hand)
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
#     display_card_hand(player_hand, dealer_hand)
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
#   display_card_hand(player_hand, dealer_hand)
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


SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
NON_NUMBER_VALUES = ['Jack', 'Queen', 'King', 'Ace']
DEALER_MIN = 17
WINING_TOTAL = 21
WINING_ROUNDS = 5
GAME_CHOICES = %w(h s hit stay)
REPLAY_CHOICES = %w(n y no yes)



def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  values = ('2'..'10').to_a + NON_NUMBER_VALUES
  SUITS.product(values).shuffle
end

def deal_one_card(deck, cards)
  cards << deck.pop
end

def total(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value.start_with('A')
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.select { |value| value.start_with('A') }.count.times do
    sum -= 10 if sum > WINING_TOTAL
  end
  
  sum
end

def busted?(cards_total)
  cards_total > WINING_TOTAL
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

    if answer.start_with('h')
      deal_one_card(deck, player_cards)
      player_total = total(player_cards)
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{player_total}"
    end

    break if answer.start_with('s') || busted?(player_total)
  end
  
  player_total
end

def dealer_turn(deck, dealer_cards, dealer_total)
  prompt "Dealer turn..."

  loop do
    dealer_total = total(dealer_cards)
    break if total(dealer_cards) >= DEALER_MIN

    prompt "Dealer hits!"
    deal_one_card(deck, dealer_cards)
    prompt "Dealer's cards are now: #{dealer_cards}"
  end
  dealer_total
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

def display_result(dealer_total, player_total)
  result = detect_result(dealer_cards, player_cards)

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

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

loop do
  deck = initialize_deck
  player_cards = []
  dealer_cards = []
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  # initial deal
  2.times do
    deal_one_card(deck, player_cards)
    deal_one_card(deck, dealer_cards)
  end

  prompt "Dealer has #{dealer_cards[0]} and ?"
  prompt "You have: #{player_cards[0]} and #{player_cards[1]}, for a total of #{player_total}."

  # player turn
  # loop do
  #   answer = nil
  #   # check for valid input
  #   loop do
  #     prompt "Would you like to (h)it or (s)stay?"
  #     answer = gets.chomp.downcase
  #     break if GAME_CHOICES.include?(answer)
  #     prompt "Sorry, must enter 'h' or 's'."
  #   end

  #   if answer.start_with('h')
  #     deal_one_card(deck, player_cards)
  #     prompt "You chose to hit!"
  #     prompt "Your cards are now: #{player_cards}"
  #     prompt "Your total is now: #{total(player_cards)}"
  #   end

  #   break if answer.start_with('s') || busted?(player_cards)
  # end

  # if busted?(player_cards)
  #   display_result(dealer_cards, player_cards)
  #   play_again? ? next : break
  # else
  #   prompt "You stayed at #{total(player_cards)}"
  # end

  # dealer turn
  prompt "Dealer turn..."

  loop do
    break if total(dealer_cards) >= DEALER_MIN

    prompt "Dealer hits!"
    deal_one_card(deck, dealer_cards)
    prompt "Dealer's cards are now: #{dealer_cards}"
  end

  if busted?(dealer_cards)
    prompt "Dealer total is now: #{total(dealer_cards)}"
    display_result(dealer_cards, player_cards)
    play_again? next : break
  else
    prompt "Dealer stays at #{total(dealer_cards)}"
  end

  puts "=============="
  prompt "Dealer has #{dealer_cards}, for a total of: #{total(dealer_cards)}"
  prompt "Player has #{player_cards}, for a total of: #{total(player_cards)}"
  puts "=============="

  display_result(dealer_cards, player_cards)

  break unless play_again?
end

prompt "Thank you for playing Twenty-One! Good bye!"
