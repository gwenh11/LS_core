=begin
Tic Tac Toe Bonus Features
Gwen Hoang
v0 2021.02.12
=end

# --constants and dependencies--------------------------------------------------
require 'yaml'
MESSAGES = YAML.load_file('tictactoe_bonus_messages.yml')

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
DANGER_COMBO = 2
GRAND_WINNER_SCORE = 5
PLAYER = 'Player'
COMPUTER = 'Computer'
VALID_TURN_INPUTS = [PLAYER, COMPUTER, 'Choose']
VALID_REPLAY = %w(y yes n no)
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

# --methods---------------------------------------------------------------------
def clear_screen
  system('clear') || system('cls')
end

def prompt(key, sub_data='')
  msg = MESSAGES[key]
  if sub_data
    msg_with_sub = format(msg, sub: sub_data)
    puts "=> #{msg_with_sub}"
  else
    puts "=> #{msg}"
  end
end

def display_instructions
  clear_screen
  prompt('instructions')
  get_player_input('start_round', 'invalid_start_round')
end

def get_player_input(msg_key, invalid_msg_key, sub_data = '')
  prompt(msg_key, sub_data)
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
  when 'first_turn' then valid_first_turn?(input)
  when 'start_round' then valid_start_round?(input)
  when 'replay_choice' then valid_replay_choice?(input)
  end
end

def valid_first_turn?(input)
  VALID_TURN_INPUTS.include?(input.capitalize)
end

def valid_start_round?(input)
  input.empty?
end

def valid_replay_choice?(input)
  VALID_REPLAY.include?(input.downcase)
end

def joinor(arr, delimiter1=', ', delimiter2='or')
  return arr.join(" #{delimiter2} ") if arr.size < 3
  arr[-1] = "#{delimiter2} #{arr.last}"
  arr.join(delimiter1)
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd, round_number)
  clear_screen
  prompt('round', round_number)
  prompt('player_marker', PLAYER_MARKER)
  prompt('computer_marker', COMPUTER_MARKER)
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

def assign_first_turn
  first_turn = get_player_input('first_turn', 'invalid_first_turn').capitalize
  if first_turn == VALID_TURN_INPUTS[2]
    first_turn = VALID_TURN_INPUTS[0..1].sample
  end
  prompt('first_move', first_turn)
  first_turn
end

def player_move!(brd)
  options = joinor(empty_squares(brd))
  prompt('square_choice', options)
  square = ''
  loop do
    square = gets.chomp.to_i
    break if valid_square?(brd, square)
    prompt('invalid_square_choice')
  end
  brd[square] = PLAYER_MARKER
end

def valid_square?(brd, input)
  empty_squares(brd).include?(input)
end

def computer_move!(brd)
  square = find_danger_square(brd, COMPUTER_MARKER)
  square = find_danger_square(brd, PLAYER_MARKER) if !square
  square == 5 if !square && brd[5] == INITIAL_MARKER
  square = empty_squares(brd).sample if !square
  brd[square] = COMPUTER_MARKER
end

def find_danger_square(brd, marker_type)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker_type) == DANGER_COMBO
      return (brd.select do |marker_position, marker|
        line.include?(marker_position) && marker == INITIAL_MARKER
      end.keys.first)
    end
  end
  nil
end

def place_piece!(brd, turn)
  turn == PLAYER ? player_move!(brd) : computer_move!(brd)
end

def alternate_player(turn)
  turn == PLAYER ? COMPUTER : PLAYER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).all?(PLAYER_MARKER)
      return PLAYER
    elsif brd.values_at(*line).all?(COMPUTER_MARKER)
      return COMPUTER
    end
  end
  nil
end

def display_round_result(brd, winner)
  if someone_won?(brd)
    prompt('someone_win', winner)
  else
    prompt('tie')
  end
end

def calculate_score(total_points, winning_turn)
  case winning_turn
  when PLAYER then total_points[:You] += 1
  when COMPUTER then total_points[:Computer] += 1
  end
  total_points.values
end

def display_score(player_points, computer_points)
  prompt('player_score', player_points)
  prompt('computer_score', computer_points)
end

def display_grand_winner(total_points)
  grand_winner = total_points.key(GRAND_WINNER_SCORE)
  prompt('grand_winner', grand_winner) if grand_winner?(total_points)
end

def grand_winner?(total_points)
  total_points.values.any? { |score| score == GRAND_WINNER_SCORE }
end

def replay?(choice)
  VALID_REPLAY[0..1].include?(choice.downcase)
end

def display_goodbye
  prompt('goodbye')
end

# --main program----------------------------------------------------------------
loop do
  display_instructions
  total_score = { You: 0, Computer: 0 }
  round = 1
  first_move = assign_first_turn
  get_player_input('start_round', 'invalid_start_round')
  loop do
    board = initialize_board
    current_player = first_move
    loop do
      display_board(board, round)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board, round)
    winner = detect_winner(board)
    display_round_result(board, winner)
    player_score, computer_score = calculate_score(total_score, winner)
    display_score(player_score, computer_score)
    get_player_input('start_round', 'invalid_start_round')
    break if grand_winner?(total_score)
    round += 1
  end

  display_grand_winner(total_score)
  replay_choice = get_player_input('replay_choice', 'invalid_replay_choice')
  break unless replay?(replay_choice)
end

display_goodbye
