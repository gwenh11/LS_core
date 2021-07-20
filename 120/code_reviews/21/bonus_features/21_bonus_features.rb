class Participant

end

class Player < Participant
  def initialize

  end

  def hit

  end

  def stay

  end

  def busted?

  end

  def total
    
  end

end

class Dealer < Participant
  def initialize

  end

  def deal

  end

  def hit

  end

  def stay

  end

  def busted?

  end

  def total

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

  def deal
    cards.pop
  end
end

module Hand
  WINING_TOTAL = 21

  def add_card
    
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

  def display_hand
    puts "#{name}'s hand."
    cards.each { puts "=> #{cards}" }
    puts "#{total}"
  end


  end

end

class 21Game

  def play
    dealer_cards
    display_hand
    player_turn
    dealer_turn
    display_result

  end

end

21Game.new.play