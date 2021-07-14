require 'yaml'
MESSAGES = YAML.load_file('tictactoe_bonus_messages.yml')

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
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  def [](num)
    @squares[num].marker
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      return squares.first.marker if three_identical_markers?(squares)
    end
    nil
  end

  def at_risk_square(marker_type)
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if two_identical_markers?(squares, marker_type)
        at_risk_square = @squares.select do |position, square|
          line.include?(position) && square.marker == Square::INITIAL_MARKER
        end
        return at_risk_square.keys.first
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).map(&:marker)
    return false if markers.size != 3
    markers.uniq.size == 1
  end

  def two_identical_markers?(squares, marker_type)
    squares.map(&:marker).count(marker_type) == 2
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
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

class Player
  LETTERS = ('a'..'z')

  include Clearable
  include Promptable

  attr_accessor :name, :marker
  attr_reader :score

  def initialize
    set_name
    reset_score
  end

  def reset_score
    @score = Score.new
  end
end

class Human < Player
  def set_name
    new_name = nil
    clear_screen
    prompt('name')
    loop do
      new_name = gets.chomp.downcase
      break unless !valid_name?(new_name) || new_name.empty?
      prompt('invalid_name')
    end
    self.name = new_name.capitalize
    prompt('greeting_human', name)
  end

  def valid_name?(new_name)
    new_name.chars.all? { |char| LETTERS.include?(char) }
  end

  def choose_marker
    choice = nil
    prompt('marker_choice')
    loop do
      choice = gets.chomp
      break unless choice.empty? || choice.size > 1
      prompt('invalid_marker_choice')
    end
    self.marker = choice
  end
end

class Computer < Player
  MARKER = 'X'
  NAMES = ['R2D2', 'Hal', 'Chapple', 'Sonny', 'Number5']

  def initialize
    super
    @marker = MARKER
  end

  def set_name
    self.name = NAMES.sample
    prompt('greeting_computer', name)
  end
end

class TTTGame
  HUMAN_TURN = 'H'
  COMPUTER_TURN = 'C'
  RANDOM_TURN = 'R'
  TURN_HASH = { HUMAN_TURN => 'Human', COMPUTER_TURN => 'Computer' }

  include Clearable
  include Promptable

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Human.new
    @computer = Computer.new
  end

  def play
    display_instructions
    main_game
    display_goodbye
  end

  private

  def main_game
    loop do
      human.choose_marker
      first_turn
      play_rounds
      display_grand_winner
      break unless play_again?
      display_play_again_message
      reset
    end
  end

  def play_rounds
    loop do
      player_move
      calculate_score
      display_board
      display_result
      display_score
      break if grand_winner?
      board.reset
    end
  end

  def player_move
    loop do
      display_board
      current_player_moves
      break if board.someone_won? || board.full?
    end
  end

  def display_instructions
    pace_interaction
    puts ""
    prompt('instructions')
    puts ""
  end

  def display_board
    clear_screen
    prompt('marker', human.name, human.marker)
    prompt('marker', computer.name, computer.marker)
    puts ""
    board.draw
    puts ""
  end

  def display_result
    case board.winning_marker
    when human.marker then prompt('someone_win', human.name)
    when computer.marker then prompt('someone_win', computer.name)
    else prompt('tie')
    end
  end

  def display_score
    pace_interaction
    prompt('score', human.name, human.score)
    prompt('score', computer.name, computer.score)
    pause_game unless grand_winner?
  end

  def display_grand_winner
    pace_interaction
    puts ""
    prompt('grand_winner', human.name) if human.score.max?
    prompt('grand_winner', computer.name) if computer.score.max?
  end

  def display_play_again_message
    prompt('play_again')
    puts ""
  end

  def display_goodbye
    puts ""
    prompt('goodbye')
  end

  def pace_interaction
    sleep(1)
  end

  def pause_game
    puts ""
    human_input('start', 'invalid_start')
  end

  def joinor(arr, delimiter1=', ', delimiter2='or')
    return arr.join(" #{delimiter2} ") if arr.size < 3
    arr[-1] = "#{delimiter2} #{arr.last}"
    arr.join(delimiter1)
  end

  def human_input(msg_key, invalid_msg_key, sub_data1='', sub_data2='')
    choice = nil
    prompt(msg_key, sub_data1, sub_data2)
    loop do
      choice = gets.chomp
      break if valid_human_input?(msg_key, choice)
      prompt(invalid_msg_key)
    end
    choice
  end

  def first_turn
    puts ""
    first_turn = human_input('first_turn', 'invalid_first_turn').capitalize
    first_turn = [HUMAN_TURN, COMPUTER_TURN].sample if first_turn == RANDOM_TURN
    @current_marker = case first_turn
                      when HUMAN_TURN then human.marker
                      when COMPUTER_TURN then computer.marker
                      end
    prompt('first_move', TURN_HASH[first_turn])
    pause_game
  end

  def human_moves
    options = joinor(board.unmarked_keys)
    square = human_input('square_choice', 'invalid_square_choice', options).to_i
    board[square] = human.marker
  end

  def computer_offense_or_defense
    square = board.at_risk_square(computer.marker)
    square = board.at_risk_square(human.marker) if !square
    5 if !square && board[5] == Square::INITIAL_MARKER
  end

  def computer_moves
    square = computer_offense_or_defense
    # square = board.at_risk_square(computer.marker)
    # square = board.at_risk_square(human.marker) if !square
    # square = 5 if !square && board[5] == Square::INITIAL_MARKER
    square = board.unmarked_keys.sample if !square
    board[square] = computer.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer.marker
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def calculate_score
    case board.winning_marker
    when human.marker then human.score.add
    when computer.marker then computer.score.add
    end
  end

  def reset
    board.reset
    human.reset_score
    computer.reset_score
    clear_screen
  end

  def valid_human_input?(msg_key, choice)
    case msg_key
    when 'start' then valid_start?(choice)
    when 'first_turn' then valid_first_turn?(choice)
    when 'square_choice' then valid_square_choice?(choice)
    when 'replay_choice' then valid_replay_choice?(choice)
    end
  end

  def valid_start?(choice)
    choice.empty?
  end

  def valid_first_turn?(choice)
    valid_turns = [HUMAN_TURN, COMPUTER_TURN, RANDOM_TURN]
    valid_turns.include?(choice.capitalize)
  end

  def valid_replay_choice?(choice)
    lowercase_choice = choice.downcase
    lowercase_choice.start_with?('y') || lowercase_choice.start_with?('n')
  end

  def valid_square_choice?(choice)
    number_choice = choice.to_i
    board.unmarked_keys.include?(number_choice)
  end

  def human_turn?
    @current_marker == human.marker
  end

  def grand_winner?
    human.score.max? || computer.score.max?
  end

  def play_again?
    pace_interaction
    puts ""
    choice = human_input('replay_choice', 'invalid_replay_choice')
    choice == 'y' || choice == 'yes'
  end
end

game = TTTGame.new
game.play
