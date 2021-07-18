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

class Deck
  def initialize

  end

  def deal

  end
end

class Card
  SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
  NON_NUMBER_FACES = ['Jack', 'Queen', 'King', 'Ace']
  NUMBER_FACES = ('2'..'10')

  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  
end

class 21Game

  def play
    dealer_cards
    display_initial_cards
    player_turn
    dealer_turn
    display_result

  end

end

21Game.new.play