require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')
MONTHS_IN_YEAR = 12

def clear_screen
  system('clear') || system('cls')
end

def pause_to_read
  sleep(2)
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

def get_name
  prompt('welcome')
  name = ''
  loop do
    name = Kernel.gets().chomp()

    if name.empty?()
      prompt('valid_name')
    else
      break
    end
  end
  name
end

def display_greeting(name)
  prompt('greeting', name)
end

def display_instruction
  prompt('instruction')
end

def integer?(num)
  num.to_i().to_s() == num
end

def float?(num)
  num.to_f().to_s() == num
end

def valid_loan?(num)
  integer?(num) && num.to_i > 0 || float?(num) && num.to_f > 0
end

def get_loan
  prompt('loan')
  loan = ''
  loop do 
    loan = Kernel.gets().chomp()

    loan.delete!('$') if loan.start_with?('$')

    if valid_loan?(loan)
      break
    else
      prompt('valid_loan')
    end
  end
  loan.to_f
end

def valid_term_years?(num)
  integer?(num) && num.to_i >= 0
end

def get_term_years
  prompt('term_years')
  term_years = ''
  loop do
    term_years = Kernel.gets().chomp()

    if valid_term_years?(term_years)
      break
    else
      prompt('valid_term_years')
    end
  end
  term_years.to_i
end

def valid_term_months?(num)
  integer?(num) && num.to_i >= 0
end

def get_term_months
  prompt('term_months')
  term_months = ''
  loop do
    term_months = Kernel.gets().chomp()

    if valid_term_months?(term_months)
      break
    else
      prompt('valid_term_months')
    end
  end
  term_months.to_i
end

def calculate_term(term_years, term_months)
  term_years * MONTHS_IN_YEAR + term_months
end

def valid_apr?(num)
  integer?(num) && (0..100).include?(num.to_i) || float?(num) && (0..100).include?(num.to_f)
end

def get_monthly_apr
  prompt('apr')
  apr = ''
  loop do
    apr = Kernel.gets().chomp()

    apr.delete!('%') if apr.end_with?('%')
    
    if valid_apr?(apr)
      break
    else
      prompt('valid_apr')
    end
  end
  
  apr_float = apr.to_f
  monthly_apr = case
                when apr_float > 1.0
                  apr_float / (MONTHS_IN_YEAR * 100)
                else
                  apr_float / MONTHS_IN_YEAR
                end
  monthly_apr
end

def prompt_calculation
  prompt('calculate_payment')
end

def calculate_payment(loan, term, monthly_apr)
  loan * (monthly_apr / (1 - (1 + monthly_apr)**(-term)))
end

def format_payment(num)
  format('%.2f', num)
end

def display_payment(payment)
  prompt('payment', payment)
end

def restart_yes?(answer)
  %w(y yes).include?(answer.downcase)
end

def valid_restart_choice?(answer)
  %w(y yes n no).include?(answer.downcase)
end

def get_restart_choice
  prompt('restart')
  choice = ''

  loop do
    choice = Kernel.gets().chomp()

    if valid_restart_choice?(choice)
      break
    else 
      prompt('valid_restart')
    end
  end
  choice
end

def display_goodbye
  prompt('goodbye')
end

# Main Program
clear_screen

name = get_name

display_greeting(name)
display_instruction
pause_to_read

loop do
  loan = get_loan
  term_years = get_term_years
  term_months = get_term_months
  term = calculate_term(term_years, term_months)
  monthly_apr = get_monthly_apr
  
  prompt_calculation
  pause_to_read

  payment = calculate_payment(loan, term, monthly_apr)
  formated_payment = format_payment(payment)
  
  display_payment(formated_payment)
  pause_to_read

  choice = get_restart_choice
  
  break unless restart_yes?(choice)
  clear_screen
end

display_goodbye
