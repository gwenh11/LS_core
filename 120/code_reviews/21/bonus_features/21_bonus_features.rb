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
    when 'press_enter' then valid_press_enter?(input)
    when 'hit_or_stay' then valid_hit_or_stay?(input)
    when 'play_again' then valid_play_again?(input)
    end
  end
  
  def valid_press_enter?(input)
    input.empty?
  end
  
  def valid_hit_or_stay?(input)
    TwentyOne::GAME_CHOICES.include?(input.downcase)
  end
  
  def valid_play_again?(input)
    REPLAY_CHOICES.include?(input.downcase)
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
    @cards = []
    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        @cards << Card.new(suit, face)
      end
    end
    cards.shuffle!
  end

  def deal_one
    cards.pop
  end
end

module Hand
  WINING_TOTAL = 21
  DEALER_MIN = 17

  def add_card(new_card)
    cards << new_card
  end
    
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

  def adjust_for_ace(sum)
    cards.select { |card| card.ace? }.count.times do
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
    # puts "#{name}'s hand."
    cards.each { |card| puts "=> #{card}" }
    puts "#{total}"
  end




end

class Score
  GRAND_WINNER_SCORE = 5

  attr_reader :score

  def initialize
    @score = 0
  end

  def add
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
  include Promptable
  include Inputable
  include Hand

  attr_accessor :cards
  attr_reader :score

  def initialize
    @cards = []
    reset_score
  end

  def reset_score
    @score = Score.new
  end
end

class Player < Participant
  

  def stay

  end
end

class Dealer < Participant




  def display_initial_hand
    prompt('dealer_initial_cards', cards.first)
    prompt('dealer_initial_total')
  end
end

class TwentyOne

  GAME_CHOICES = %w(h s hit stay)
  include Promptable
  include Inputable

  attr_accessor :deck, :dealer, :player

  def initialize
    @deck = Deck.new
    @dealer = Dealer.new
    @player = Player.new
  end

  def play
    dealer_cards
    display_initial_hands
    player_turn
    dealer_turn
    display_result

  end

  private

  def clear_screen
    system('clear') || system('cls')
  end

  def pause_game
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

  def display_initial_hands
    puts "Dealer"
    p dealer
    dealer.display_initial_hand
    puts "Player"
    p player
    player.display_hand
  end


  def player_turn
    choice = nil
    loop do
      choice = get_player_input('hit_or_stay', 'invalid_hit_or_stay')
      if choice == 'h'
        prompt('player_hit')
        player.add_card(deck.deal_one)
        player.display_hand
        p player.total
      end
      break if choice == 's' || player.busted?
    end
  end
  
  def dealer_turn
    prompt('dealer_turn')
    loop do
      break if dealer.total >= Hand::DEALER_MIN
      prompt('dealer_hit')
      dealer.add_card(deck.deal_one)
      prompt('dealer_current_cards', player)
    end
    display_dealer_status
  end

  def display_dealer_status
    pace_interaction
    if dealer.busted?
      prompt('dealer_busted_warning', Hand::WINING_TOTAL)
    else
      prompt('dealer_stay', dealer.total)
    end
    pace_interaction
  end

  def display_result
    player_total = player.total
    dealer_total = dealer.total

    if player_total > Hand::WINING_TOTAL
      prompt('player_busted')
    elsif dealer_total > Hand::WINING_TOTAL
      prompt('dealer_busted')
    elsif dealer_total < player_total
      prompt('player')
    elsif player_total < dealer_total
      prompt('dealer')
    else
      prompt('tie')
    end
  end

  # def hit_or_stay!
  #   answer = get_player_input('hit_or_stay', 'invalid_hit_or_stay')
  #   if answer.start_with?('h')
  #     prompt('player_hit')
  #     self.add_card
  #     end
  # end
end

TwentyOne.new.play