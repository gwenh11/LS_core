class Player
  VALUES = {
    'r' => 'Rock',
    'p' => 'Paper',
    's' => 'Scissors',
    'l' => 'Lizard',
    'k' => 'Spock'
  }

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
    @past_moves << move.value
  end

  def reset_score
    @score = 0
  end
end

class Computer < Player
  attr_accessor :type
  attr_reader :move_freq

  def set_name
    self.name = ['R2D2', 'Hal', 'Chapple', 'Sonny', 'Number5'].sample
  end

  # def set_computer(computer_name)
  #   self.type = Object.const_get(computer_name).new
  # end

  def choose
    computer_moves = []
    type = Object.const_get(self.name).new
    all_values = VALUES.values
    all_freqs = type.move_freq

    hash_moves = all_values.zip(all_freqs).to_h

    hash_moves.each do |value, freq| 
      freq.times { computer_moves << value }
    end
    self.move = Move.set_move(computer_moves.sample)
  end

  # def choose
  #   self.move = Move.set_move(self.all_computer_moves.sample)
  # end
end

class R2D2 < Computer
  def initialize
    @move_freq = [100, 0, 0, 0, 0]
  end
end

class Hal < Computer
  def initialize
    @move_freq = [10, 0, 60, 20, 10]
  end
end

class Chapple < Computer
  def initialize
    @move_freq = [0, 0, 0, 50, 50]
  end
end

class Sonny < Computer
  def initialize
    @move_freq = [50, 50, 0, 0, 0]
  end
end

class Number5 < Computer
  def initialize
    @move_freq = [20, 20, 20, 20, 20]
  end
end

class Move
  attr_reader :value

  def self.set_move(move_type)
    Object.const_get(move_type).new
  end

  def win?(other_move)
    self.lose_values.include?(other_move.value)
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

class Lizard < Move
  def initialize
    @value = 'Lizard'
    @lose_values = %w(Paper Spock)
  end
end

class Spock < Move
  def initialize
    @value = 'Spock'
    @lose_values = %w(Rock Scissors)
  end
end

p computer = Computer.new
# p computer.name
p computer.choose
computer.set_past_moves
p computer