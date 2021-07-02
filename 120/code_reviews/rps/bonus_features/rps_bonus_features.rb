class Player
  attr_accessor :name, :move
  attr_reader :score, :past_moves

  def initialize
    @past_moves = []
    reset_score
    set_name
  end

  def set_score
    @score += 1
  end

  def set_past_moves
    @past_moves << move
  end

  def reset_score
    @score = 0
  end
end

class Human < Player
  def set_name
    new_name = ''
    loop do
      puts "What's your name?"
      break unless new_name.empty?
      puts "Sorry, must enter a value"
    end
    self.name = new_name
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp.downcase
      break if Move::VALUES.keys.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chapple', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.keys.sample)
  end
end

class R2D2

end

class Hal

end

class Chapple

end

class Sonny

end

class Number_5

end

class Move
  VALUES = {
    'r' => 'Rock',
    'p' => 'Paper',
    's' => 'Scissors',
    'l' => 'Lizard',
    'k' => 'Spock'
  }

  # WIN_RELATIONS = {
  #   'Rock' => %w(Lizard Scissors),
  #   'Paper' => %w(Rock Spock),
  #   'Scissors' => %w(Paper Lizard),
  #   'Lizard' => %w(Paper Spock),
  #   'Spock' => %w(Rock Scissors)
  # }

  attr_reader :value

  def type(type_shortened)
    @type = TYPES[type_shortened]
  end

  def win?(other_move)
    lose_values.include?(other_move)
  end

  def to_s
    @value
  end
end

class Rock < Move
  def initialize
    @value = 'Rock'
    @lose_values = %w(Lizard Scissors)
  end
end

class Paper < Move
  def initialize
    @value = 'Paper'
    @lose_values = %w(Rock Spock)
  end
end

class Scissors < Move
  def initialize
    @value = 'Scissors'
    @lose_values = %w(Paper Lizard)
  end
end

class Lizzard < Move
  def initialize
    @value = 'Lizzard'
    @lose_values = %w(Paper Spock)
  end
end

class Spock < Move
  def initialize
    @value = 'Spock'
    @lose_values = %w(Rock Scissors)
  end
end

class RPSGame
  WIN_SCORE = 2

  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Goodbye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_winner
    if human.move.win?(computer.move)
      puts "#{human.name} won!"
    elsif computer.move.win?(human.move)
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_scores
    puts "#{human.name} score is #{human.score}"
    puts "#{computer.name} score is #{computer.score}"
  end

  def display_grand_winner
    puts "#{human.name} is the grand winner!" if human.score == WIN_SCORE
    puts "#{computer.name} is the grand winner!" if computer.score == WIN_SCORE
  end

  def display_past_moves
    puts "#{human.name}'s past moves are: #{joinand(human.past_moves)}."
    puts "#{computer.name}'s past moves are: #{joinand(computer.past_moves)}."
  end

  def joinand(arr, delimiter1=', ', delimiter2='and')
    return arr.join(" #{delimiter2} ") if arr.size < 3
    arr[-1] = "#{delimiter2} #{arr.last}"
    arr.join(delimiter1)
  end

  def calculate_score
    human.set_score if human.move.win?(computer.move)
    computer.set_score if computer.move.win?(human.move)
  end

  def grand_winner?
    human.score == WIN_SCORE || computer.score == WIN_SCORE
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end

    answer == 'y'
  end

  def play_rounds
    loop do
      human.choose
      human.set_past_moves
      computer.choose
      computer.set_past_moves
      calculate_score
      display_moves
      display_winner
      display_scores
      break if grand_winner?
    end
  end

  def play_game
    display_welcome_message
    loop do
      play_rounds
      display_grand_winner
      break unless play_again?
      human.reset_score
      computer.reset_score
    end
    display_past_moves
    display_goodbye_message
  end
end

RPSGame.new.play_game
