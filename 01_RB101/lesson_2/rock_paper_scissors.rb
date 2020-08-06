=begin
Algorithm:
  1. Create a method to ask user to make a choice - rock, paper or scissors
  2. Generate random computer choice by capturing these values and sampling over them
  3. Extract rock, paper, scissors array to a constant array so that it can be used
  throughout the program
  4. Create a loop to validate user input (include rock, paper, scissors) - exit loop when
  valid choice is received. Otherwise, display an error message
  5. Display user choice and computer choice
  6. Create logic for winning, losing and tie
  7. Wrap all the game logic into one big loop and ask user if they want to play again
  8. Extract logic for winning, losing and tie into a method - it looks cleaner and debug
  easier - interaction within a single method vs interaction within program

Things to consider:
  1. The order of a method creation doesn't matter. Moving method #display_results above
  #prompt doesn't affect method execution
  2. The order of a method creation doesn't matter, but a method has to be defined before it
  is invoked. #prompt method is included inside #test_method. If #test_method is invoked
  before #prompt is defined, it will generate undefined method error. Otherwise, the program
  works fine.
  3. If #display_result returns a string, store a string inside a variable and invoke #prompt
  on that string
  4. To mitigate Rubocop error on #display_result. One thought is to extract the logic to another method

Notes on Rubocop errors:
  1. Cyclomatic complexity - how many paths a code can flow through
=end

VALID_CHOICES = %w(rock paper scissors)

def test_method
  prompt('test message')
end

# test_method

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_results(player, computer)
  if win?(player, computer)
    "You won!"
  elsif win?(computer, player)
    "Computer won!"
  else
    "It's a tie!"
  end
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

test_method

loop do
  choice = ''
  loop do
    # Build a string from the constant array - join the elements seperated by given seperators. Add join method to notes
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid coice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  result = display_results(choice, computer_choice)

  prompt(result)

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  # break out of the loop if user answer DOES NOT start with 'y' - unless == if not
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for playing. Good bye!")
