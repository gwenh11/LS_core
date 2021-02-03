require 'pry-byebug'

BOARD_SIZE = 3
WINNING_SCORE = 2
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_COMBINATIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + 
                         [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                         [[1, 5, 9], [3, 5, 7]]

def prompt(message)
  puts "=> #{message}"
end

def display_board(round, markers)
  # system('clear') || system('cls')
  puts "Round ##{round}"
  puts "You're a #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"

  total_columns = BOARD_SIZE * 8
  total_rows = BOARD_SIZE * 4
  markers_key = 1
  board = Array.new(13) {Array.new(25, ' ')}

  for row in 0..total_rows
    for column in 0..total_columns
      if column % 8 == 0 && row % 4 == 0
        board[row][column] = '+'
      elsif column % 8 == 0
        board[row][column] = '|'
      elsif row % 4 == 0
        board[row][column] = '-'
      elsif column % 4 == 0 && row % 2 == 0
        board[row][column] = markers[markers_key]
        markers_key += 1
      end
    end
  end
  board.each { |sub_arr| puts sub_arr.join }
end


def initialize_markers
  new_markers = {}
  (1..9).each { |num| new_markers[num] = INITIAL_MARKER}
  new_markers
end

def empty_squares(markers)
  markers.keys.select { |num| markers[num] == INITIAL_MARKER}
end

def joinor(blank_squares, delimiter1 = ', ', delimiter2 = 'or ')
  blank_squares[0..blank_squares.size - 2].join(delimiter1) + ' ' + delimiter2 + blank_squares[blank_squares.size-1].to_s
end

def user_move!(markers)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(markers))}): "
    square = gets.chomp.to_i
    break if empty_squares(markers).include?(square)
    prompt "Sorry, that's not a valid choice!"
  end

  markers[square] = PLAYER_MARKER
end

def find_at_risk_square(markers)
  at_risk_combinations = WINNING_COMBINATIONS.select do |combination|
    markers.values_at(*combination).count(PLAYER_MARKER) == 2
  end
  at_risk_square = []
  if !at_risk_combinations.empty?
    at_risk_combinations.each do |combination|
      combination.each do |position|
        if markers[position] == ' '
          at_risk_square << position
        end
      end
    end
  end
  at_risk_square



end

def computer_move!(markers, at_risk_square)
  if at_risk_square.empty?
    square = empty_squares(markers).sample
  else
    square = at_risk_square.sample
  end
  markers[square] = COMPUTER_MARKER
end

def board_full?(markers)
  empty_squares(markers).empty?
end

# !! turn expression into a boolean
# nil becomes false, truthy becomes true
def someone_won?(markers)
  !!detect_winner(markers)
end

# explicit return statement. That's why nil is ignore.
def detect_winner(markers)
  WINNING_COMBINATIONS.each do |combination|
    # binding.pry
    if markers.values_at(*combination).count(PLAYER_MARKER) == 3
      return 'You'
    elsif markers.values_at(*combination).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def calculate_score(total_score, winner)
  total_score[:user] += 1 if winner == 'You'
  total_score[:computer] +=1 if winner == 'Computer'
end

def display_score(total_score)
  puts " "
  prompt "Your score is: #{total_score[:user]}"
  prompt "Computer score is: #{total_score[:computer]}"
  puts " "
  gets.chomp
end

def grand_winner?(total_score)
  total_score[:user] == WINNING_SCORE || total_score[:computer] == WINNING_SCORE
end

def display_grand_winner(total_score)
  prompt "You are the grand winner!" if total_score[:user] == WINNING_SCORE
  prompt "Computer is the grand winner!" if total_score[:computer] == WINNING_SCORE
end


loop do


  game_round = 1
  game_score = { :user => 0, :computer => 0 }
  

  loop do
    game_markers = initialize_markers
    loop do
      display_board(game_round, game_markers)
      user_move!(game_markers)
      display_board(game_round, game_markers)
     
      break if someone_won?(game_markers) || board_full?(game_markers)
      at_risk_square = find_at_risk_square(game_markers)
      p at_risk_square
      # binding.pry
      computer_move!(game_markers, at_risk_square)
      display_board(game_round, game_markers)
      break if someone_won?(game_markers) || board_full?(game_markers)
    end

    if someone_won?(game_markers)
      prompt "#{detect_winner(game_markers)} won!"
    else
      prompt "It's a tie!"
    end
    calculate_score(game_score, detect_winner(game_markers))
    display_score(game_score)
    
    if grand_winner?(game_score)
      break
    end
    
    game_round += 1
   
  end

  display_grand_winner(game_score)

  prompt "Play again? (y or n)"
  answer = gets.chomp
  if !answer.downcase.start_with?('y')
    
     break
  end

end

prompt "Thanks for playing Tic Tac Toe! Goodbye!"

