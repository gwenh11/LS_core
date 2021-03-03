SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
NON_NUMBER_VALUES = ['Jack', 'Queen', 'King', 'Ace']
DEALER_MIN = 17
WINING_TOTAL = WINING_TOTAL
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
      prompt "You chose to hit!"
      prompt "Your cards are now: #{player_cards}"
      prompt "Your total is now: #{total(player_cards)}"
    end

    break if answer.start_with('s') || busted?(player_cards)
  end

  if busted?(player_cards)
    display_result(dealer_cards, player_cards)
    play_again? ? next : break
  else
    prompt "You stayed at #{total(player_cards)}"
  end

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
