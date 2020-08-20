=begin
Mortgage Calculator
Gwen Hoang

***v1 2020.08.19
=end

# --constants and dependencies--------------------------------------------------
require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')
MONTHS_IN_YEAR = 12
VALID_RESTART_CHOICES = %w(y yes n no)

# --methods---------------------------------------------------------------------
def clear_screen
  Kernel.system('clear') || Kernel.system('cls')
end

def pace_interaction
  Kernel.sleep(2)
end

def prompt(key, sub_data='')
  message = MESSAGES[key]
  if sub_data
    message_with_sub = format(message, sub: sub_data)
    puts("\n=> #{message_with_sub}")
  else
    puts("\n=> #{message}")
  end
end

def display_welcome
  prompt('welcome')
end

def get_name
  prompt('name')
  name = ''
  loop do
    name = Kernel.gets().chomp()
    invalid_name?(name) ? prompt('invalid_name') : break
  end
  name
end

def invalid_name?(name)
  name.empty?() || name == ' ' * name.length()
end

def display_greeting(name)
  prompt('greeting', name)
end

def get_loan_data(data_type, invalid_data_type)
  prompt(data_type)
  loan_data = ''
  loop do
    loan_data = Kernel.gets().chomp()
    break if valid_loan_data?(loan_data, data_type)
    prompt(invalid_data_type)
  end
  loan_data
end

def valid_loan_data?(loan_data, data_type)
  case data_type
  when 'loan_amt' then valid_loan_amt?(loan_data)
  when 'term_years' then valid_term_years?(loan_data)
  when 'term_months' then valid_term_months?(loan_data)
  when 'apr' then valid_apr?(loan_data)
  end
end

def valid_loan_amt?(num)
  integer?(num) && num.to_i >= 0 || float?(num) && num.to_f >= 0
end

def valid_term_years?(num)
  integer?(num) && num.to_i >= 0
end

def valid_term_months?(num)
  integer?(num) && num.to_i >= 0 && num.to_i <= 11
end

def valid_apr?(num)
  integer?(num) && (0..100).include?(num.to_i) ||
    float?(num) && (0..100).include?(num.to_f)
end

def integer?(num)
  num.to_i().to_s() == num
end

def float?(num)
  num.to_f().to_s() == num
end

def prompt_calculation
  prompt('calculate_payment')
end

def calculate_payment(loan_amt, term_years, term_months, apr)
  loan_term = calculate_loan_term(term_years, term_months)
  monthly_apr = calculate_monthly_apr(apr)
  if monthly_apr == 0
    (loan_amt.to_f) / loan_term
  else
    (loan_amt.to_f) * (monthly_apr / (1 - (1 + monthly_apr)**(-loan_term)))
  end
end

def calculate_loan_term(term_years, term_months)
  term_years.to_i * MONTHS_IN_YEAR + term_months.to_i
end

def calculate_monthly_apr(apr)
  apr_float = apr.to_f
  if apr_float > 1
    apr_float / (MONTHS_IN_YEAR * 100)
  else
    apr_float / MONTHS_IN_YEAR
  end
end

def display_payment(payment)
  if payment.nan?() || payment.infinite?()
    prompt('invalid_payment')
  elsif payment == 0
    prompt('zero_payment')
  else
    prompt('payment', format('%.2f', payment))
  end
end

def restart_yes?(choice)
  VALID_RESTART_CHOICES[0..1].include?(choice.downcase)
end

def valid_restart_choice?(choice)
  VALID_RESTART_CHOICES.include?(choice.downcase)
end

def get_restart_choice
  prompt('restart')
  choice = ''
  loop do
    choice = Kernel.gets().chomp()
    break if valid_restart_choice?(choice)
    prompt('invalid_restart')
  end
  choice
end

def display_goodbye
  prompt('goodbye')
end

# --main program----------------------------------------------------------------
clear_screen
display_welcome

name = get_name

display_greeting(name)

loop do
  loan_amt = get_loan_data('loan_amt', 'invalid_loan_amt')
  term_years = get_loan_data('term_years', 'invalid_term_years')
  term_months = get_loan_data('term_months', 'invalid_term_months')
  apr = get_loan_data('apr', 'invalid_apr')

  prompt_calculation
  pace_interaction

  payment = calculate_payment(loan_amt, term_years, term_months, apr)

  display_payment(payment)
  pace_interaction

  choice = get_restart_choice

  break unless restart_yes?(choice)
  clear_screen
end

display_goodbye
