require 'yaml'
MESSAGES = YAML.load_file('tictactoe_bonus_messages.yml')

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
DANGER_COMBO = 2
GRAND_WINNER_SCORE = 2
PLAYER = 'Player'
COMPUTER = 'Computer'
VALID_INPUTS = [PLAYER, COMPUTER, 'Choose']
VALID_REPLAY = %w(y yes n no)
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(key, sub_data='')
  msg = MESSAGES[key]
  if sub_data
    msg_with_sub = format(msg, sub: sub_data)
    puts "=> #{msg_with_sub}"
  else
    puts "=> #{msg}"
  end
end

def get_player_input(msg_key, sub_data = '', invalid_msg_key)
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
  when 'start' then valid_start?(input)
  when 'square_choice' then valid_square?(input)
  when 'replay_choice' then valid_replay_choice?(input)
  end
end

def valid_start?(input)
  input.empty?
end

def valid_square?(input)
  empty_squares(brd).include?(input)
end

def valid_replay_choice?(input)
  VALID_REPLAY.include?(choice.downcase)
end

def joinor(arr, delimiter1=', ', delimiter2='or')
  return arr.join(" #{delimiter2} ") if arr.size < 3
  arr[-1] = "#{delimiter2} #{arr.last}"
  arr.join(delimiter1)
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd, round_number)
  # system('clear') || system('cls')
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
  options = joinor(empty_squares(brd))
  square = get_player_input('square_choice', options, invalid_square_choice)
  brd[square] = PLAYER_MARKER
end

def computer_move!(brd)
  square = nil
  WINNING_LINES.each do |line|
    WINNING_LINES.each do |line|
      square = find_danger_square(line, brd, COMPUTER_MARKER)
      break if square
    end
  end

  if !square
    WINNING_LINES.each do |line|
    square = find_danger_square(line, brd, PLAYER_MARKER)
    break if square
    end
  end

  if !square && brd[5] == INITIAL_MARKER
    square = 5
  end

  if !square
    square = empty_squares(brd).sample
  end

  brd[square] = COMPUTER_MARKER
end

def find_danger_square(brd, marker_type)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker_type) == DANGER_COMBO
      brd.select do |marker_position, marker|
        line.include?(marker_position) && marker == INITIAL_MARKER
      end.keys.first
    else
      nil
    end
  end
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
      return PLAYER_WIN
    elsif brd.values_at(*line).all?(COMPUTER_MARKER)
      return COMPUTER_WIN
    end
  end
  nil
end

def calculate_score(total_points, winning_turn)
  case winning_turn
  when PLAYER then total_points[:You] += 1
  when COMPUTER then total_points[:Computer] += 1
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

  current_player = ''

  puts "Pick who to play"
    start_choice = gets.chomp.downcase
    if start_choice == 'choose'
      # binding.pry
      current_player = VALID_START_CHOICE[0..1].sample
      prompt "#{current_player} goest first!"
    else
      current_player = start_choice
    end
  loop do
    board = initialize_board

    loop do
      


      display_board(board, round)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)

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