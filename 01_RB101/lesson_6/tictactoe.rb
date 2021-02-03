require 'pry'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
PLAYER_WIN = 'You'
COMPUTER_WIN = 'Computer'
WINNING_COMBO = 3
DANGER_COMBO = 2
GRAND_WINNER_SCORE = 2
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, delimiter1=', ', delimiter2='or')
  if arr.size < 3
    return arr.join(" #{delimiter2} ")
  end
  arr[-1] = "#{delimiter2} #{arr.last}"
  arr.join(delimiter1)
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd, round_number)
  system('clear') || system('cls')
  puts "Round #{round_number}"
  puts "You are '#{PLAYER_MARKER}'"
  puts "Computer is '#{COMPUTER_MARKER}'"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_move!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that is not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def computer_move!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def find_danger_square(brd)
  ksdj
def 

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == WINNING_COMBO
      return PLAYER_WIN
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == WINNING_COMBO
      return COMPUTER_WIN
    end
  end
  nil
end

def calculate_score(total_points, win_turn)
  case win_turn
  when PLAYER_WIN then total_points[:You] += 1
  when COMPUTER_WIN then total_points[:Computer] += 1
  end
  total_points.values
end

def display_score(player_points, computer_points)
  prompt "Your score is #{player_points}"
  prompt "Computer score is #{computer_points}"
end

def display_grand_winner(total_points)
  grand_winner = total_points.key(GRAND_WINNER_SCORE)
  prompt "Grand Winner is #{grand_winner}" if grand_winner?(total_points)
end

def grand_winner?(total_points)
  total_points.values.any? { |score| score == GRAND_WINNER_SCORE }
end

loop do
  total_score = { You: 0, Computer: 0 }
  round = 1
  loop do
    board = initialize_board
    loop do
      
      display_board(board, round)
      player_move!(board)
      break if someone_won?(board) || board_full?(board)

      computer_move!(board)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board, round)

    winner = detect_winner(board)
    if someone_won?(board)
      prompt "#{winner} won!"
    else
      prompt "It is a tie!"
    end

    player_score, computer_score = calculate_score(total_score, winner)
    display_score(player_score, computer_score)
    
    loop do
      prompt "When you are ready, press the 'enter' key to continue."
      choice = gets.chomp
      break if choice.empty?()
      prompt "Sorry, that is not a valid choice."
    end
    break if grand_winner?(total_score)
    round += 1
  end

  display_grand_winner(total_score)
  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
