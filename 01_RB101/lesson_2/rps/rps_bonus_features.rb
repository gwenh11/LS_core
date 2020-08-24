=begin
RPS Bonus Features
Gwen Hoang
v1 2020.08.23
=end

# --constants and dependencies--------------------------------------------------
require 'yaml'
MESSAGES = YAML.load_file('rps_bonus_messages.yml')
WIN_SCORE = 5
VALID_REPLAY = %w(y yes n no)

VALID_CHOICES = {
  'r' => 'Rock',
  'p' => 'Paper',
  's' => 'Scissors',
  'l' => 'Lizard',
  'k' => 'Spock'
}

WIN_RELATIONS = {
  'Rock' => %w(Lizard Scissors),
  'Paper' => %w(Rock Spock),
  'Scissors' => %w(Paper Lizard),
  'Lizard' => %w(Paper Spock),
  'Spock' => %w(Rock Scissors)
}

# --methods---------------------------------------------------------------------
def clear_screen
  Kernel.system('clear') || Kernel.system('cls')
end

def pace_interaction
  Kernel.sleep(1)
end

def prompt(key, sub_data='')
  message = MESSAGES[key]
  if sub_data
    message_with_sub = format(message, sub: sub_data)
    puts("=> #{message_with_sub}")
  else
    puts("=> #{message}")
  end
end

def display_instructions
  prompt('instructions')
  puts('')
end

def display_round(round)
  prompt('round', round)
end

def get_user_input(message_key, invalid_message_key)
  prompt(message_key)
  input = ''
  loop do
    input = Kernel.gets().chomp()
    break if valid_user_input?(message_key, input)
    prompt(invalid_message_key)
  end
  input
end

def valid_user_input?(message_key, input)
  case message_key
  when 'game_start' then valid_game_start?(input)
  when 'choice_letter' then valid_user_choice?(input)
  when 'replay_choice' then valid_replay_choice?(input)
  end
end

def valid_game_start?(choice)
  choice.empty?()
end

def valid_user_choice?(choice_letter)
  VALID_CHOICES.keys().include?(choice_letter.downcase)
end

def valid_replay_choice?(choice)
  VALID_REPLAY.include?(choice.downcase)
end

def get_computer_choice
  VALID_CHOICES.values().sample()
end

def display_choices(user_choice, computer_choice)
  prompt('user_choice', user_choice)
  prompt('computer_choice', computer_choice)
end

def display_winner(user_choice, computer_choice)
  if win?(user_choice, computer_choice)
    prompt('user_win')
  elsif win?(computer_choice, user_choice)
    prompt('computer_win')
  else
    prompt('tie')
  end
end

def win?(first, second)
  WIN_RELATIONS[first].include?(second)
end

def calculate_score(total_score, user_choice, computer_choice)
  total_score[:user] += 1 if win?(user_choice, computer_choice)
  total_score[:computer] += 1 if win?(computer_choice, user_choice)
end

def display_total_score(round, total_score)
  puts('')
  prompt('total_score', round)
  prompt('user_total_score', total_score[:user])
  prompt('computer_total_score', total_score[:computer])
  puts('')
end

def display_grand_winner(total_score)
  prompt('user_grand_winner') if total_score[:user] == WIN_SCORE
  prompt('computer_grand_winner') if total_score[:computer] == WIN_SCORE
end

def grand_winner?(total_score)
  total_score[:user] == WIN_SCORE || total_score[:computer] == WIN_SCORE
end

def replay?(choice)
  VALID_REPLAY[0..1].include?(choice.downcase)
end

def display_goodbye
  prompt('goodbye')
end

# --main program----------------------------------------------------------------
clear_screen
display_instructions
get_user_input('game_start', 'invalid_game_start')
clear_screen

total_score = { user: 0, computer: 0 }
round = 1
loop do
  loop do
    display_round(round)

    choice_letter = get_user_input('choice_letter', 'invalid_choice_letter')
    user_choice = VALID_CHOICES[choice_letter.downcase]
    computer_choice = get_computer_choice

    pace_interaction
    display_choices(user_choice, computer_choice)
    pace_interaction
    display_winner(user_choice, computer_choice)
    pace_interaction
    calculate_score(total_score, user_choice, computer_choice)
    display_total_score(round, total_score)
    pace_interaction
    clear_screen
    break if grand_winner?(total_score)
    round += 1
  end

  display_grand_winner(total_score)
  display_total_score(round, total_score)
  pace_interaction

  replay_choice = get_user_input('replay_choice', 'invalid_replay_choice')

  if replay?(replay_choice)
    round = 1
    total_score[:user] = 0
    total_score[:computer] = 0
    clear_screen
  else
    break
  end
end

display_goodbye
