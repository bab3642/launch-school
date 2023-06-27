require 'yaml'
require 'pry'

LANG = 'es' # May change language to 'en' or 'es'

MESSAGES = YAML.load_file('calculator_messages.yml')

OPERATION_SYMBOLS = {
  '1': "+",
  '2': "-",
  '3': "*",
  '4': "/"
}

CONTINUE = {
  true => ['y', 'yes', 'sí'],
  false => ['n', 'no']
}

def prompt(message, interpolating_hash = {})
  Kernel.puts("=>  #{format(MESSAGES[LANG][message], interpolating_hash)}")
end

def valid_number?(num)
  /^-?\d+$/.match(num) || float?(num)
end

def float?(input)
  /\d/.match(input) && /^-?\d*\.\d*$/.match(input)
end

def calculate(operator, num1, num2)
  case operator
  when '1'
    num1.to_f() + num2.to_f()
  when '2'
    num1.to_f() - num2.to_f()
  when '3'
    num1.to_f() * num2.to_f()
  when '4'
    num1.to_f() / num2.to_f()
  end
end

def get_num(string)
  loop do
    prompt("#{string}_num")
    num = Kernel.gets().chomp()

    if valid_number?(num)
      return num
    else
      prompt('invalid_num')
    end
  end
end

def get_operator(num2)
  loop do
    operator = Kernel.gets().chomp()
    if div_zero?(operator, num2)
      prompt('zero_divide')
    elsif %w(1 2 3 4).include?(operator)
      return operator
    else
      prompt('valid_operator')
    end
  end
end

def div_zero?(operator, denominator)
  operator == '4' && denominator.to_f == 0
end

def get_user_name
  loop do
    user_name = Kernel.gets().chomp()

    if user_name.strip.empty?()
      prompt('valid_name')
    else
      return user_name
    end
  end
end

def continue?
  loop do
    input = Kernel.gets().chomp()
    if CONTINUE[true].include?(input.downcase())
      return true
    elsif CONTINUE[false].include?(input.downcase())
      return false
    else
      prompt('invalid_continue')
    end
  end
end

def operation_to_message(operator)
  MESSAGES[LANG]['operations'][operator.to_i]
end

def display_results(number1, operator, number2, result)
  prompt('result', {
                      op: OPERATION_SYMBOLS[operator.to_sym],
                      res: result,
                      num1: number1,
                      num2: number2
                    })
end

# Welcome prompt, get user name
prompt('welcome')

user_name = get_user_name()
system("clear")
prompt('username', name: user_name)

# Main code loop
loop do
  number1 = get_num('first')
  number2 = get_num('second')

  prompt('operator_prompt')
  operator = get_operator(number2)

  prompt('operating', op: operation_to_message(operator))

  result = calculate(operator, number1, number2)
  display_results(number1, operator, number2, result)

  prompt('again?')

  break unless continue?()
  system("clear")
end

prompt('goodbye', name: user_name)
