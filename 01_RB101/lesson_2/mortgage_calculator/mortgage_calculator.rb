=begin

Build a mortgage calculator
- Ask the user for the loan amount, APR and loan duration (in years)
- Calculate monthly interest based on APR
- Calculate loan duration in months
- Calculate monthly payment
- Output the result 

**********************************************************************

FORMAL PSEUDO-CODE

START

Ask user for three inputs:
    1) loan_amount
    2) apr
    3) duration_years

SET MONTHS = 12 
SET monthly_interest = apr / MONTHS
SET duration_months = duration_years * MONTHS
SET payment = p * (j / (1 - (1 + j)**(-n)))

PRINT payment

END

**********************************************************************

REFACTOR

- Build a loop to repeat the calculation unless user says no
- Ask user for name and include a loop to check for valid name
- Build a method to check for valid input 
- Build a loop to get vavlid input from user

=end

MONTHS = 12

def prompt(message)
  puts "=> #{message}"
end

def valid_input?(input)
  input.to_f.to_s == input && input.to_f > 0.0
end

prompt("Welcome to Mortgage Calculator! Enter your name:")

name = ''
loop do
  name = Kernel.gets().chomp()
  
  if name.empty?()
    prompt("Make sure you enter a valid name")
  else
    break
  end
end

prompt("Hi #{name}")

loop do

  loan_amount = ''
  loop do
    prompt("Enter a number for the loan amount:")
    loan_amount = Kernel.gets().chomp()

    if valid_input?(loan_amount)
      break
    else 
      prompt("Hmm...that doesn't look a valid loan ammount.")
    end
  end

  apr = ''
  loop do
    prompt("Enter the annual percentage rate (APR):")
    apr = Kernel.gets().chomp()

    if valid_input?(apr)
      break
    else
      prompt("Hmm...that doesn't look like a valid annual percentage rate.")
    end
  end

  duration_years = ''
  loop do
    prompt("Enter the loan duration (in years):")
    duration_years = Kernel.gets().chomp()

    if valid_input?(duration_years)
      break
    else
      prompt("Hmm...that doesn't look like a valid number for year(s).")
    end
  end

  if apr.to_f < 1
    monthly_interest_rate = apr / MONTHS
  else
    monthly_interest_rate = apr / (100 * MONTHS)
  end

  duration_months = duration_years * MONTHS
  monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-duration_months)))

  prompt("Calculating monthly payment...")

  prompt("The monthly mortgage payment is: #{monthly_payment}")

  prompt("Do you want to calculate another monthly mortgage payment (Y to calculate again)?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with('y')
end

prompt("Thank you for using Mortgage Calculator!")
