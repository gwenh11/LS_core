# Rubocop OO TTT

We're now ready to run our code through Rubocop. If you've been following along, you should only see a few offenses.

```bash
$ rubocop tictactoe.rb
Inspecting 1 file
C

Offenses:

tictactoe.rb:16:26: C: Space between { and | missing.
    @squares.keys.select {|key| @squares[key].unmarked? }
                         ^^
tictactoe.rb:38:17: C: Space between { and | missing.
    (1..9).each {|key| @squares[key] = Square.new}
                ^^
tictactoe.rb:38:50: C: Space missing inside }.
    (1..9).each {|key| @squares[key] = Square.new}
                                                 ^
tictactoe.rb:41:3: C: Assignment Branch Condition size for draw is too high. [20/18]
  def draw
  ^^^

tictactoe.rb:64:1: C: Extra empty line detected at class body end.

tictactoe.rb:109:3: C: Method has too many lines. [15/10]
  def play
  ^^^

1 file inspected, 7 offenses detected
```

These are all really easy to fix, other than the problem with the `Board#draw` and `TTTGame#play` methods. Because `Board#draw` method is only for output, it's safe to skip Rubocop on this method. Let's let Rubocop know.

```ruby
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
def draw
  puts ""
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
  puts ""
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
```

`TTTGame#play` method will require a bit more work. Since this method is an "orchestration" method—in the sense that it orchestrates the sequence of actions related to game play—it should generally consist only of other method invocations.

Notice that the inner loop of this method is really just the player move, so we can define a method `player_move` and move this logic there.

```ruby
def player_move
  loop do
    current_player_moves
    break if board.someone_won? || board.full?
    clear_screen_and_display_board if human_turn?
  end
end
```

The `play` method would now look like this:

```ruby
def play
  clear
  display_welcome_message

  loop do
    display_board
    player_move
    display_result
    break unless play_again?
    reset
    display_play_again_message
  end

  display_goodbye_message
end
```

There is still room from improvement though. The whole outer loop is really our main game. So we can create a separate method `main_game` and extract the logic there:

```ruby
def main_game
  loop do
    display_board
    player_move
    display_result
    break unless play_again?
    reset
    display_play_again_message
  end
end
```

Both of these methods `main_game` and `player_move` can be `private` so, our final version of `play` method would be:

```ruby
def play
  clear
  display_welcome_message
  main_game
  display_goodbye_message
end
```

After fixing the errors, extracting the code into helper methods and adding the comments above, we should see no more offenses.

```bash
$ rubocop tictactoe.rb
Inspecting 1 file
.

1 file inspected, no offenses detected
```

#### Final Code

After removing the `require "pry"` at the top, the final code is below.

```ruby
class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
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
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
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
  # rubocop:enable Metrics/AbcSize

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
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

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = HUMAN_MARKER

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    clear
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  def main_game
    loop do
      display_board
      player_move
      display_result
      break unless play_again?
      reset
      display_play_again_message
    end
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def human_moves
    puts "Choose a square (#{board.unmarked_keys.join(', ')}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "You won!"
    when computer.marker
      puts "Computer won!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def clear
    system "clear"
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

game = TTTGame.new
game.play
```