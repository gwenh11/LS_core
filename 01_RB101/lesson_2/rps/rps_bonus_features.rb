MAX_ROUNDS = 5

VALID_CHOICES = {
  's' => 'scissors', 
  'p' => 'paper', 
  'r' => 'rock', 
  'l' => 'lizzard',
  'o' => 'spock'}

KEY_BEAT_VALUE = {
  'scissors' => %w(paper lizzard),
  'paper' => %w(rock spock),
  'rock' => %w(lizzard scissors),
  'lizzard' => %w(paper, spock),
  'spock' => %w(rock scissors)
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def get_user_input(message)
  prompt(message)
  Kernel.gets().chomp()
end

def get_computer_choice
  VALID_CHOICES[VALID_CHOICES.keys().sample()]
end

def valid_input?(letter)
  VALID_CHOICES.keys().include?(letter)
end

def win?(winner, loser)
  KEY_BEAT_VALUE[winner].include?(loser)
end

def display_results(user, computer)
  if win?(user, computer)
    "You won!"
  elsif win?(computer, user)
    "Computer won!"
  else
    "It's a tie!"
  end
end

def user_score(user, computer)
  win?(user, computer) ? 1 : 0
end

def computer_score(user, computer)
  win?(computer,user) ? 1 : 0
end

round = 1
score_board = {
  :user => 0,
  :computer => 0
}

prompt("test")
loop do
  prompt("ROUND #{round}")

  user_input = ""
  user_choice = ""
  loop do
    user_input = get_user_input("Enter a letter: ")
    if valid_input?(user_input)
      user_choice = VALID_CHOICES[user_input]
      break
    else
      prompt("Not a valid choice!")
    end
  end

  p computer_choice = get_computer_choice

  result = display_results(user_choice, computer_choice)

  score_board[:user] += user_score(user_choice, computer_choice)
  score_board[:computer] += computer_score(user_choice, computer_choice)

  prompt("Your score is #{score_board[:user]}, Computer score is #{score_board[:computer]}")
  
  round += 1

  if round < MAX_ROUNDS
    prompt("Press any key for next round.")
    pause = Kernel.gets().chomp()
    system("clear")
  else
    prompt("The match is over!")
  end

  break if round > MAX_ROUNDS
end