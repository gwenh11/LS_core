=begin
21 Game Bonus Features
Gwen Hoang
v0 2021.03.03
=end

# --constants and dependencies--------------------------------------------------
require 'yaml'
MESSAGES = YAML.load_file('21_bonus_messages.yml')

SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
NON_NUMBER_VALUES = ['Jack', 'Queen', 'King', 'Ace']
NUMBER_VALUES = ('2'..'10')
DEALER_MIN = 17
WINING_TOTAL = 21
GRAND_WINNER_SCORE = 5
SCREEN_WIDTH = 80
GAME_CHOICES = %w(h s hit stay)
REPLAY_CHOICES = %w(n y no yes)

# --methods---------------------------------------------------------------------
def clear_screen
  system('clear') || system('cls')
end

def pace_interaction_quick
  sleep(2)
end

def pace_interaction_slow
  sleep(4)
end

def pause_for_player
  add_new_line
  get_player_input('press_enter', 'press_enter')
end

def add_new_line
  puts ''
end

def add_decorative_line
  puts '-' * SCREEN_WIDTH
end

def joinand(arr, delimiter1=', ', delimiter2='and')
  return arr.join(" #{delimiter2} ") if arr.size < 3
  arr[-1] = "#{delimiter2} #{arr.last}"
  arr.join(delimiter1)
end

def prompt(key, sub_data='')
  msg = MESSAGES[key]
  if sub_data
    msg_with_sub = format(msg, sub: sub_data)
    puts "=> #{msg_with_sub}"
  else
    puts "=> #{msg}"
  end
end

def get_player_input(msg_key, invalid_msg_key, sub_data = '')
  prompt(msg_key, sub_data)
  input = ''
  loop do
    input = gets.chomp
    break if valid_player_input?(msg_key, input)
    prompt(invalid_msg_key)
  end
  input
end

def valid_player_input?(msg_key, input)
  case msg_key
  when 'press_enter' then valid_press_enter?(input)
  when 'hit_or_stay' then valid_hit_or_stay?(input)
  when 'play_again' then valid_play_again?(input)
  end
end

def valid_press_enter?(input)
  input.empty?
end

def valid_hit_or_stay?(input)
  GAME_CHOICES.include?(input.downcase)
end

def valid_play_again?(input)
  REPLAY_CHOICES.include?(input.downcase)
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
    sum += if value == 'Ace'
             11
           elsif value.to_i == 0
             10
           else
             value.to_i
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

def initialize_deal(deck, dealer_cards, player_cards)
  2.times do
    deal_one_card(deck, player_cards)
    deal_one_card(deck, dealer_cards)
  end

  player_total = total(player_cards)
  display_initial_hands(dealer_cards, player_cards, player_total)
end

def display_initial_dealer_hand(dealer_cards)
  dealer_hand = count_cards([dealer_cards[0]])
  prompt('dealer_initial_cards', dealer_hand)
  prompt('dealer_initial_total')
end

def display_dealer_hand(dealer_cards, dealer_total)
  dealer_hand = count_cards(dealer_cards)
  prompt('dealer_all_cards', dealer_hand)
  prompt('dealer_total', dealer_total)
end

def display_player_hand(player_cards, player_total)
  player_hand = count_cards(player_cards)
  prompt('player_all_cards', player_hand)
  prompt('player_total', player_total)
end

def display_initial_hands(dealer_cards, player_cards, player_total)
  pace_interaction_quick
  add_new_line
  add_decorative_line
  display_initial_dealer_hand(dealer_cards)
  add_new_line
  display_player_hand(player_cards, player_total)
  add_decorative_line
  add_new_line
end

def player_turn!(deck, player_cards)
  player_total = player_hit_or_stay!(deck, player_cards)
  display_player_status(player_total)
  player_total
end

def player_hit_or_stay!(deck, player_cards)
  player_total = total(player_cards)
  loop do
    answer = get_player_input('hit_or_stay', 'invalid_hit_or_stay')
    if answer.start_with?('h')
      prompt('player_hit')
      deal_one_card(deck, player_cards)
      player_total = total(player_cards)
      pace_interaction_quick
      prompt('player_current_cards', count_cards(player_cards))
      pace_interaction_slow
      prompt('player_current_total', player_total)
    end
    break if answer.start_with?('s') || busted?(player_total)
  end

  player_total
end

def display_player_status(player_total)
  pace_interaction_quick
  if busted?(player_total)
    prompt('player_busted_warning', WINING_TOTAL)
  else
    prompt('player_stay', player_total)
  end
  pace_interaction_quick
end

def dealer_turn!(deck, dealer_cards)
  add_new_line
  prompt('dealer_turn')
  pace_interaction_quick
  dealer_total = dealer_hit!(deck, dealer_cards)
  display_dealer_status(dealer_total)
  dealer_total
end

def dealer_hit!(deck, dealer_cards)
  dealer_total = total(dealer_cards)
  loop do
    dealer_total = total(dealer_cards)
    break if dealer_total >= DEALER_MIN

    prompt('dealer_hit')
    deal_one_card(deck, dealer_cards)
    pace_interaction_quick
    prompt('dealer_current_cards', count_cards(dealer_cards))
    pace_interaction_slow
  end

  dealer_total
end

def display_dealer_status(dealer_total)
  pace_interaction_quick
  if busted?(dealer_total)
    prompt('dealer_busted_warning', WINING_TOTAL)
  else
    prompt('dealer_stay', dealer_total)
  end
  pace_interaction_quick
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

def display_result(result)
  pace_interaction_quick
  case result
  when :player_busted then prompt('player_busted')
  when :dealer_busted then prompt('dealer_busted')
  when :player then prompt('player')
  when :dealer then prompt('dealer')
  when :tie then prompt('tie')
  end
end

def calculate_score(result, score)
  case result
  when :player_busted then score[:dealer] += 1
  when :dealer_busted then score[:player] += 1
  when :player then score[:player] += 1
  when :dealer then score[:dealer] += 1
  end
end

def grand_winner?(score)
  score.values.any? { |value| value == GRAND_WINNER_SCORE }
end

def play_again?
  pace_interaction_quick
  add_new_line
  answer = get_player_input('play_again', 'invalid_play_again')
  answer.start_with?('y')
end

def display_instructions
  clear_screen
  prompt('instructions')
  pause_for_player
end

def display_all_hands(dealer_cards, player_cards, dealer_total, player_total)
  pace_interaction_quick
  add_new_line
  add_decorative_line
  display_dealer_hand(dealer_cards, dealer_total)
  add_new_line
  display_player_hand(player_cards, player_total)
  add_decorative_line
  add_new_line
end

def display_score(score)
  pace_interaction_quick
  add_new_line
  add_decorative_line
  prompt('dealer_score', score[:dealer])
  prompt('player_score', score[:player])
  add_decorative_line
end

def display_grand_winner(score)
  pace_interaction_quick
  clear_screen
  add_decorative_line
  grand_winner = score.key(GRAND_WINNER_SCORE).to_s.upcase
  prompt('grand_winner', grand_winner)
  add_decorative_line
  add_new_line
end

def play_one_round(score, deck)
  player_cards = []
  dealer_cards = []

  initialize_deal(deck, dealer_cards, player_cards)
  player_total = player_turn!(deck, player_cards)
  dealer_total = total(dealer_cards)

  unless busted?(player_total)
    dealer_total = dealer_turn!(deck, dealer_cards)
  end

  display_all_hands(dealer_cards, player_cards, dealer_total, player_total)
  result = detect_result(dealer_total, player_total)
  display_result(result)
  calculate_score(result, score)
  display_score(score)
  pause_for_player
end

def play_one_game
  deck = initialize_deck
  score = { player: 0, dealer: 0 }
  round = 1
  loop do
    clear_screen
    prompt('round', round)
    play_one_round(score, deck)
    break if grand_winner?(score)
    round += 1
  end
  display_grand_winner(score)
end

# --main program----------------------------------------------------------------
loop do
  display_instructions
  play_one_game
  break unless play_again?
end

prompt('goodbye')
