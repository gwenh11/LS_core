require 'yaml'
MESSAGES = YAML.load_file('21_bonus_messages.yml')

module Clearable
  def clear_screen
    system('clear') || system('cls')
  end
end

module Promptable
  def prompt(key, sub_data1='', sub_data2='')
    message = MESSAGES[key]
    if sub_data1 && sub_data2
      message = format(message, sub1: sub_data1, sub2: sub_data2)
    elsif sub_data1
      message = format(sub1: sub_data1)
    end
    puts("=> #{message}")
  end

  def joinand(arr, delimiter1=', ', delimiter2='and')
    return arr.join(" #{delimiter2} ") if arr.size < 3
    arr[-1] = "#{delimiter2} #{arr.last}"
    arr.join(delimiter1)
  end
end

module Inputable
  def get_player_input(msg_key, invalid_msg_key, sub_data1='', sub_data2='')
    prompt(msg_key, sub_data1, sub_data2)
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
    when 'read_instructions' then valid_read_instructions?(input)
    when 'name' then valid_name?(input)
    when 'press_enter' then valid_press_enter?(input)
    when 'hit_or_stay' then valid_hit_or_stay?(input)
    when 'play_again' then valid_play_again?(input)
    end
  end

  def valid_read_instructions?(input)
    TwentyOne::YES_OR_NO.include?(input.downcase)
  end

  def valid_name?(input)
    input.downcase.chars.all? { |char| Participant::LETTERS.include?(char) } &&
      !input.empty?
  end

  def valid_press_enter?(input)
    input.empty?
  end

  def valid_hit_or_stay?(input)
    TwentyOne::GAME_CHOICES.include?(input.downcase)
  end

  def valid_play_again?(input)
    TwentyOne::YES_OR_NO.include?(input.downcase)
  end
end

module Displayable
  def display_instructions
    puts ""
    choice = get_player_input('read_instructions', 'invalid_yes_or_no')
    if choice == 'y' || choice == 'yes'
      clear_screen
      prompt('instructions', Score::GRAND_WINNER_SCORE)
    end
    pause_game unless choice == 'n' || choice == 'no'
  end

  def display_goodbye
    prompt('goodbye')
  end

  def display_initial_hands
    dealer.display_initial_hand
    pace_interaction
    player.display_initial_hand
  end

  def display_all_hands
    dealer.display_hand
    player.display_hand
  end

  def display_status(participant)
    if participant.busted?
      prompt('busted_warning', participant.name, Hand::WINING_TOTAL)
    else
      prompt('stay', participant.name, participant.total)
    end
  end

  def display_result
    player_name = player.name
    dealer_name = dealer.name
    puts ""
    case detect_result
    when :player_busted then prompt('busted', player_name, dealer_name)
    when :dealer_busted then prompt('busted', dealer_name, player_name)
    when :player then prompt('win', player_name)
    when :dealer then prompt('win', dealer_name)
    when :tie then prompt('tie')
    end
  end

  def display_score
    pace_interaction
    puts ""
    prompt('score', dealer.name, dealer.score)
    prompt('score', player.name, player.score)
    pause_game unless grand_winner?
  end

  def display_grand_winner
    pace_interaction
    puts ""
    prompt('grand_winner', dealer.name) if dealer.score.max?
    prompt('grand_winner', player.name) if player.score.max?
  end
end

class Card
  SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
  FACES = ('2'..'10').to_a + ['Jack', 'Queen', 'King', 'Ace']

  attr_reader :suit, :face

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def jack?
    face == 'Jack'
  end

  def queen?
    face == 'Queen'
  end

  def king?
    face == 'King'
  end

  def ace?
    face == 'Ace'
  end

  def to_s
    "#{face} of #{suit}"
  end
end

class Deck
  attr_accessor :cards

  def initialize
    reset
  end

  def deal_one
    cards.pop
  end

  def reset
    @cards = []
    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        @cards << Card.new(suit, face)
      end
    end
    cards.shuffle!
  end
end

module Hand
  WINING_TOTAL = 21
  DEALER_MIN = 17

  def add_card(new_card)
    cards << new_card
  end

  # rubocop:disable Metrics/MethodLength
  def calculate_initial_sum
    sum = 0
    cards.each do |card|
      sum += if card.ace?
               11
             elsif card.jack? || card.queen? || card.king?
               10
             else
               card.face.to_i
             end
    end
    sum
  end
  # rubocop:enable Metrics/MethodLength

  def adjust_for_ace(sum)
    cards.select(&:ace?).count.times do
      sum -= 10 if sum > WINING_TOTAL
    end
    sum
  end

  def total
    sum = calculate_initial_sum
    adjust_for_ace(sum)
  end

  def busted?
    total > WINING_TOTAL
  end

  def count_cards
    cards.each
  end

  def display_hand
    puts ""
    prompt('hand', name)
    cards.each { |card| puts "=> #{card}" }
    prompt('total', name, total)
  end
end

class Score
  GRAND_WINNER_SCORE = 2

  attr_reader :score

  def initialize
    @score = 0
  end

  def add_one
    @score += 1
  end

  def max?
    @score == GRAND_WINNER_SCORE
  end

  def to_s
    score.to_s
  end
end

class Participant
  LETTERS = ('a'..'z')

  include Clearable
  include Promptable
  include Inputable
  include Hand

  attr_accessor :cards, :name
  attr_reader :score

  def initialize
    reset_hand
    set_name
    reset_score
  end

  def reset_score
    @score = Score.new
  end

  def reset_hand
    @cards = []
  end
end

class Player < Participant
  def set_name
    clear_screen
    self.name = get_player_input('name', 'invalid_name').capitalize
    prompt('greeting_player', name)
  end

  def display_initial_hand
    display_hand
  end
end

class Dealer < Participant
  NAMES = %w(R2D2 Hal Chapple Sonny Number5)

  def set_name
    self.name = NAMES.sample
    prompt('greeting_dealer', name)
  end

  def display_initial_hand
    prompt('hand', name)
    puts "=> Unknown"
    puts "=> #{cards.first}"
    prompt('total', name, 'unknown')
  end
end

class TwentyOne
  GAME_CHOICES = %w(h hit s stay)
  YES_OR_NO = %w(y yes n no)

  include Promptable
  include Inputable
  include Displayable

  attr_accessor :deck, :dealer, :player

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def main_game
    display_instructions
    loop do
      play_rounds
      break unless play_again?
      reset_deck_and_hands
      reset_score
      clear_screen
    end
    display_goodbye
  end

  private

  # rubocop:disable Metrics/MethodLength
  def play_rounds
    loop do
      clear_screen
      dealer_cards
      display_initial_hands
      player_turn
      dealer_turn unless player.busted?
      calculate_score
      display_result
      display_score
      break if grand_winner?
      reset_deck_and_hands
    end
    display_grand_winner
  end
  # rubocop:enable Metrics/MethodLength

  def clear_screen
    system('clear') || system('cls')
  end

  def pause_game
    puts ""
    get_player_input('press_enter', 'press_enter')
  end

  def pace_interaction
    sleep(1)
  end

  def dealer_cards
    2.times do
      player.add_card(deck.deal_one)
      dealer.add_card(deck.deal_one)
    end
  end

  # rubocop:disable Metrics/MethodLength
  def player_turn
    choice = nil
    loop do
      puts ""
      choice = get_player_input('hit_or_stay', 'invalid_hit_or_stay')
      if choice == 'h'
        prompt('hit', player.name)
        player.add_card(deck.deal_one)
        pace_interaction
        player.display_hand
      end
      break if choice == 's' || player.busted?
    end
    display_status(player)
  end
  # rubocop:enable Metrics/MethodLength

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def dealer_turn
    puts ""
    prompt('dealer_turn', dealer.name)
    dealer.display_hand
    loop do
      break if dealer.total >= Hand::DEALER_MIN
      prompt('hit', dealer.name)
      dealer.add_card(deck.deal_one)
      pace_interaction
      dealer.display_hand
    end
    pace_interaction
    display_status(dealer)
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  # rubocop:disable Metrics/MethodLength
  def detect_result
    player_total = player.total
    dealer_total = dealer.total
    if player_total > Hand::WINING_TOTAL
      :player_busted
    elsif dealer_total > Hand::WINING_TOTAL
      :dealer_busted
    elsif dealer_total < player_total
      :player
    elsif dealer_total > player_total
      :dealer
    else
      :tie
    end
  end
  # rubocop:enable Metrics/MethodLength

  def calculate_score
    player_score = player.score
    dealer_score = dealer.score
    case detect_result
    when :player_busted then dealer_score.add_one
    when :dealer_busted then player_score.add_one
    when :player then player_score.add_one
    when :dealer then dealer_score.add_one
    end
  end

  def grand_winner?
    dealer.score.max? || player.score.max?
  end

  def play_again?
    puts ""
    choice = get_player_input('play_again', 'invalid_yes_or_no')
    choice == 'y' || choice == 'yes'
  end

  def reset_deck_and_hands
    deck.reset
    dealer.reset_hand
    player.reset_hand
  end

  def reset_score
    dealer.reset_score
    player.reset_score
  end
end

TwentyOne.new.main_game
