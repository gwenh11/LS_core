require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key, sub_data=nil)
  message = messages(key, LANGUAGE)
  if sub_data
    message_with_sub = format(message, sub: sub_data)
    Kernel.puts("=> #{message_with_sub}")
  else
    Kernel.puts("=> #{message}")
  end
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def operation_to_message(op)
  word = case op
         when '1'
           MESSAGES[LANGUAGE]['adding']
         when '2'
           MESSAGES[LANGUAGE]['subtracting']
         when '3'
           MESSAGES[LANGUAGE]['multiplying']
         when '4'
           MESSAGES[LANGUAGE]['dividing']
         end
  word
end

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

prompt('greeting', name)

loop do
  number1 = ''
  loop do
    prompt('number1')
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt('invalid_number')
    end
  end

  number2 = ''
  loop do
    prompt('number2')
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt('invalid_number')
    end
  end

  prompt('operator_prompt')
  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('operator_option')
    end
  end

  op_process = operation_to_message(operator)
  prompt('operation_message', op_process)
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

  prompt('result', result)

  prompt('restart')
  answer = Kernel.gets().chomp()
  if answer.downcase().start_with?('y')
    Kernel.system("clear")
  else
    break
  end
end

prompt('goodbye')
