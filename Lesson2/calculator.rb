require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'en'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  Kernel.puts("=> #{message ? message : key}")
end

def valid_number?(number)
  # can be integer or float
  # number.to_i.to_s == number || number.to_f.to_s == number
  /\d/.match(number) && /^\d*\.?\d*$/.match(number)
end

def operation_to_message(operator)
  message = case operator
            when '+'
              messages('adding', LANGUAGE)
            when '-'
              messages('subtracting', LANGUAGE)
            when '*'
              messages('multiplying', LANGUAGE)
            when '/'
              messages('dividing', LANGUAGE)
            end
  return message
end

prompt('welcome')
username = ''
loop do
  username = Kernel.gets().chomp()
  if username.empty?()
    prompt('valid_name')
  else
    break
  end
end

prompt("#{messages('hello', LANGUAGE)} #{username}!")
number1, number2 = nil
loop do
  loop do
    prompt('enter_number')
    number1 = Kernel.gets.chomp()
    if valid_number?(number1)
      break
    else
      prompt('valid_number')
    end
  end

  loop do
    prompt('enter_2nd_number')
    number2 = Kernel.gets.chomp()
    if valid_number?(number2)
      break
    else
      prompt('valid_number')
    end
  end

  numbers = [number1.to_f, number2.to_f]
  prompt('enter_operator')
  operation = nil
  loop do
    operation = Kernel.gets().chomp()
    if %w(+ - * /).include?(operation)
      break
    else
      prompt('valid_operator')
    end
  end

  prompt("#{operation_to_message(operation)} #{messages('two_numbers', LANGUAGE)}...")

  result =  case operation
            when '+'
              numbers[0] + numbers[1]
            when '-'
              numbers[0] - numbers[1]
            when '*'
              numbers[0] * numbers[1]
            when '/'
              if numbers[1] == 0
                messages('error_div_zero', LANGUAGE)
              else
                numbers[0] / numbers[1]
              end
            else
              messages('error_unknown', LANGUAGE)
            end

  prompt("#{messages('answer', LANGUAGE)} #{result}")
  prompt('do_another')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
prompt("#{messages('thanks', LANGUAGE)} #{messages('app_name', LANGUAGE)}, #{username}!")
