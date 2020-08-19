# Obtain external messages
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# Constant
LANGUAGE = {
  '1' => 'en',
  '2' => 'vi'
}

# Methods
def clear_screen
  Kernel.system('clear')
end

def prompt_dual_language(key)
  Kernel.puts("=> #{MESSAGES[key]}")
end

def valid_language?(lang_option)
  LANGUAGE.keys.include?(lang_option)
end

def display_language_option
  prompt_dual_language('language_option')
end

def get_language
  lang_option = ''
  loop do
    lang_option = Kernel.gets().chomp()

    if valid_language?(lang_option)
      break
    else
      prompt_dual_language('invalid_language')
    end
  end
  LANGUAGE[lang_option]
end

def prompt(key, lang, sub_data='')
  message = MESSAGES[lang][key]
  if sub_data
    message_with_sub = format(message, sub: sub_data)
    Kernel.puts("=> #{message_with_sub}")
  else
    Kernel.puts("=> #{message}")
  end
end

def valid_name?(name)
  name.empty?() || name == ' ' * name.length()
end

def get_name(lang)
  prompt('welcome', lang)
  name = ''
  loop do
    name = Kernel.gets().chomp()

    if valid_name?(name)
      prompt('invalid_name', lang)
    else
      break
    end
  end
  name
end

def display_greeting(name, lang)
  prompt('greeting', lang, name)
end

def display_instruction(lang)
  prompt('instruction', lang)
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

def get_number(key, lang)
  prompt(key, lang)
  num = ''
  loop do
    num = Kernel.gets().chomp()

    if valid_number?(num)
      break
    else
      prompt('invalid_number', lang)
    end
  end
  num
end

def display_operation_option(lang)
  prompt('operator_prompt', lang)
end

def valid_operator?(op)
  %w(1 2 3 4).include?(op)
end

def get_operation(lang)
  op = ''
  loop do
    op = Kernel.gets().chomp()

    if valid_operator?(op)
      break
    else
      prompt('operator_option', lang)
    end
  end
  op
end

def operation_to_message(op, lang)
  word = case op
         when '1'
           MESSAGES[lang]['adding']
         when '2'
           MESSAGES[lang]['subtracting']
         when '3'
           MESSAGES[lang]['multiplying']
         when '4'
           MESSAGES[lang]['dividing']
         end
  word
end

def display_operation_choice(op_message, lang)
  prompt('operation_message', lang, op_message)
end

def get_calculation(op, number1, number2)
  result = case op
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end
  result
end

def display_result(result, lang)
  if result.infinite?()
    prompt('invalid_result', lang, result)
  else
    prompt('result', lang, result)
  end
end

def valid_restart_choice?(choice)
  %w(y yes n no).include?(choice.downcase())
end

def get_restart_choice(lang)
  prompt('restart_choice', lang)
  choice = ''
  loop do
    choice = Kernel.gets().chomp()

    if valid_restart_choice?(choice)
      break
    else
      prompt('invalid_restart_choice', lang)
    end
  end
  choice
end

def restart?(choice)
  %w(y yes).include?(choice.downcase())
end

def display_goodbye(lang)
  prompt('goodbye', lang)
end

# Main Program
clear_screen
display_language_option

lang = get_language
name = get_name(lang)

display_greeting(name, lang)
display_instruction(lang)

loop do
  number1 = get_number('number1', lang)
  number2 = get_number('number2', lang)

  display_operation_option(lang)

  op = get_operation(lang)
  op_message = operation_to_message(op, lang)

  display_operation_choice(op_message, lang)

  result = get_calculation(op, number1, number2)

  display_result(result, lang)

  restart_choice = get_restart_choice(lang)

  break unless restart?(restart_choice)
  clear_screen
end

display_goodbye(lang)
