# PROCESS:
#   ask the user for two numbers
#   ask the user for an operation to perform
#   perform the operation on the two numbers
#   output the result

# REFACTOR:
#   build a method 'prompt' to add a bullet point before each prompt so that the prompt stands out to the user.
#   use a case statement instead of if and elsif to improve code readability.
#   add a loop construct to test validity (a valid numerical respresenation input) of user input. If input 
#     isn't valid, let the user know and loop the program back to the beginning to ask for user input.
#   add a loop construct that envelopes the whole program - the main loop. It will ask the user if they want 
#     to perform the operation again. If yes, the whole program will be execute. 
#   add a loop construct to test for valid operation 
#   use heredoc that creates multiline string to organize operation prompt. In addition, add a statement 
#     showing which oepration is being execute - addition, subtraction, multiplication or division

# THINGS TO CONSIDER:
#   String#to_f convert leading characters to floating point number. Ignore anything past the end of a valid number. 
#     Return 0.0 if there is no valid number. 
#   When we write Ruby code that's not in a class, we are working within an object called main, which is an intance 
#     Object. The Kernel module is automatically loaded by Object, giving access to al methods. 
def prompt(message)
  Kernel.puts("=> #{message}")
end

# We can use this method because if user input a string, calling the to_i method on a string will return 0. However, this method will exclude '0' that is entered from the user (as a string).Never raise an exception.
def valid_number?(num)
  num.to_i() != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to Calculator! Enter your name:")

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to use a valid name.")
  else 
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  # Need to initialized number1 outside of loop, because the variable is used outside of loop. Any varible ceated inside loop can only used inside loop.
  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break # break out of loop if valid input
    else 
      prompt("Hmm... that doesn't look like a valid number.")
    end
  end

  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt("Hmm... that doesn't look like a valid number.")
    end
  end

operator_prompt = <<-MSG
What operation would you like to perform?
  1) add
  2) subtract
  3) multiply
  4) dividing
MSG
  
  prompt(operator_prompt) 
  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Please choose 1, 2, 3 or 4.")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")
  result = case operator
          when '1'
            number1.to_i() + number2.to_i()
          when '2'
            number1.to_i() - number2.to_i()
          when '3'
            number1.to_i() * number2.to_i()
          when '4'
            number1.to_f() / number2.to_f()
  end

  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
  # expression after unless evaluates to false, break the loop
end

prompt("Thanks for using the calculator. Good bye!")