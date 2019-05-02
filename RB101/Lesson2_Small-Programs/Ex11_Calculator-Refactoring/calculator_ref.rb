# method definitions
def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(number)
  number.to_i != 0
end

def operation_to_message(operator)
  case operator
  when '1' then 'Adding'
  when '2' then 'Subtracting'
  when '3' then 'Multiplying'
  when '4' then 'Dividing'
  end
end

# prompt greeting and input
prompt("Welcome to Calculator! Enter your name: ")
name = nil
loop do
  # get name
  name = Kernel.gets().chomp()
  # ask again if name has zero length
  if name.empty?
    prompt("Make sure to use a valid name!")
  else
    break
  end
end

# main loop
loop do
  # initialize variables set by the user
  number1 = nil
  number2 = nil
  operator = nil

  # get valid first number
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()
    if valid_number?(number1)
      break
    else
      Kernel.puts("Hmm... that doesn't look like a valid number!")
    end
  end

  # get valid second number
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()
    if valid_number?(number2)
      break
    else
      Kernel.puts("Hmm... that doesn't look like a valid number!")
    end
  end

  # get operator
  operator_prompt = <<-MSG
What operation would you like to perform?
  1) add
  2) subtract
  3) multiply
  4) divide
MSG
  prompt(operator_prompt)

  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Operator has to be 1,2,3 or 4.")
    end
  end

  # confirm operation chosen
  prompt("#{operation_to_message(operator)} the two numbers...")

  # apply operator to operands
  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           else
             "Invalid operator!"
           end

  # compute and show result
  prompt("The result is #{result}.")

  # prompt for another run
  prompt("Do you want to perform another calculation? (Y to calculate again): ")
  answer = Kernel.gets().chomp()

  # keep looping if answer starts with anything else than 'y'
  break unless answer.downcase().start_with?('y')
end

# goodbye message
prompt("Thank you #{name} for using Calculator!")
