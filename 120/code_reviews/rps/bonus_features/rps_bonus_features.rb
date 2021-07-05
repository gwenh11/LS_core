require 'pry'
require 'yaml'
MESSAGES = YAML.load_file('rps_bonus_messages.yml')

module Clearable
  def clear_screen
    system('clear') || system('cls')
  end
  
end

module Pausable
  def pause_game(message_key, invalid_message_key)
    prompt(message_key)
    input = ''
    loop do
      input = gets.chomp
      break if input.empty?
      prompt(invalid_message_key)
    end
    input
  end

  def pace_interaction
    sleep(1)
  end
end

module Promptable
  def prompt(key, sub_data1='', sub_data2='')
    message = MESSAGES[key]
    if sub_data1 && sub_data2
      message = MESSAGES[key] % {sub1: sub_data1, sub2: sub_data2}
    elsif sub_data1
      message = MESSAGES[key] % {sub1: sub_data1}
    end
    puts("=> #{message}")
  end
end

class Player
  VALUES = {
    'r' => 'Rock',
    'p' => 'Paper',
    's' => 'Scissors',
    'l' => 'Lizard',
    'k' => 'Spock'
  }

  include Clearable
  include Promptable

  attr_accessor :name, :move
  attr_reader :score, :past_moves

  def initialize
    @past_moves = []
    reset_score
    set_name
  end

  

  def set_past_moves
    @past_moves << move.value
  end

  def reset_score
    @score = Score.new
  end
end

class Score
  WIN_SCORE = 2

  attr_reader :player_score

  def initialize
    @player_score = 0
  end

  def add_point
    @player_score += 1
  end

  def max?
    player_score == WIN_SCORE
  end

  def to_s
    "#{@player_score}"
  end
end

class Human < Player
  def set_name
    new_name = ''
    loop do
      clear_screen
      prompt('name')
      new_name = gets.chomp
      break unless new_name.empty?
      prompt('invalid_name')
    end
    self.name = new_name.capitalize
    prompt('greeting_user', name)
  end

  def choose
    choice = nil
    loop do
      prompt('choice_letter')
      choice = gets.chomp.downcase
      break if VALUES.keys.include? choice
      prompt('invalid_choice_letter')
    end
    self.move = Move.set_move(VALUES[choice])
  end
end

class Computer < Player
  attr_reader :move_freq

  def set_name
    self.name = ['R2D2', 'Hal', 'Chapple', 'Sonny', 'Number5'].sample
    prompt('greeting_computer', name)
  end

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
  attr_reader :value, :lose_values

  def self.set_move(move_type)
    Object.const_get(move_type).new
  end

  def win?(other_move)
    lose_values.include?(other_move.value)
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

class RPSGame
  include Clearable
  include Pausable
  include Promptable

  attr_accessor  :human, :computer, :round

  def initialize
    @human = Human.new
    @computer = Computer.new
    @round = 1
  end

  

 

  def joinand(arr, delimiter1=', ', delimiter2='and')
    return arr.join(" #{delimiter2} ") if arr.size < 3
    arr[-1] = "#{delimiter2} #{arr.last}"
    arr.join(delimiter1)
  end



  # def valid_user_input?(message_key, input)
  #   case message_key
  #   when 'start' then valid_start?(input)
  #   when 'choice_letter' then valid_user_choice?(input)
  #   when 'replay_choice' then valid_replay_choice?(input)
  #   end
  # end

  # def valid_start?(choice)
  #   choice.empty?()
  # end
  
  # def valid_user_choice?(choice_letter)
  #   VALID_CHOICES.keys().include?(choice_letter.downcase)
  # end
  
  # def valid_replay_choice?(choice)
  #   VALID_REPLAY.include?(choice.downcase)
  # end

  def display_instructions
    pace_interaction
    puts('')
    prompt('instructions')
    puts('')
    pause_game('start', 'invalid_start')
  end

  def display_round
    clear_screen
    prompt('round', round)
  end

  def display_moves
    pace_interaction
    prompt('user_choice', human.name, human.move)
    prompt('computer_choice', computer.name, computer.move)
  end

  def display_winner
    pace_interaction
    if human.move.win?(computer.move)
      prompt('user_win', human.name)
    elsif computer.move.win?(human.move)
      prompt('computer_win', computer.name)
    else
      prompt('tie')
    end
  end

  def display_scores
    pace_interaction
    puts('')
    prompt('score', round)
    prompt('user_score', human.name, human.score)
    prompt('computer_score', computer.name, computer.score)
    pause_game('start', 'invalid_start')
  end

  def display_grand_winner
    clear_screen
    prompt('user_grand_winner', human.name) if human.score.max?
    prompt('computer_grand_winner', computer.name) if computer.score.max?
  end

  def display_past_moves
    pace_interaction
    puts "#{human.name}'s past moves are: #{joinand(human.past_moves)}."
    puts "#{computer.name}'s past moves are: #{joinand(computer.past_moves)}."
  end

  def display_goodbye_message
    prompt('goodbye')
  end

  def increase_round
    self.round += 1
  end

  def reset_round
    self.round = 1
  end

  def players_choose
    human.choose
    computer.choose
  end

  def record_players_moves
    human.set_past_moves
    computer.set_past_moves
  end

  def calculate_score
    human.score.add_point if human.move.win?(computer.move)
    computer.score.add_point if computer.move.win?(human.move)
  end

  def grand_winner?
    human.score.max? || computer.score.max?
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
      display_round
      players_choose
      record_players_moves
      display_moves
      calculate_score
      display_winner
      display_scores
      break if grand_winner?
      increase_round
    end
  end

  def play_game
    display_instructions
    loop do
      play_rounds
      display_grand_winner
      break unless play_again?
      human.reset_score
      computer.reset_score
      reset_round
    end
    display_past_moves
    display_goodbye_message
  end


  
end

RPSGame.new.play_game
