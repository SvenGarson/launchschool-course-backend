# prompt greeting and input
Kernel.puts("Welcome to Calculator!")

# get first and second number
Kernel.puts("What's the first number?")
number1 = Kernel.gets().chomp()

Kernel.puts("What's the second number?")
number2 = Kernel.gets().chomp()

# get operator
Kernel.puts("What operation would you like to perform?\n1) add\n2) subtract\n3) mutliply\n4) divide")
operator = Kernel.gets().chomp()

# apply operator to operands
if operator == '1'
  result = number1.to_i + number2.to_i
elsif operator == '2'
  result = number1.to_i - number2.to_i
elsif operator == '3'
  result = number1.to_i * number2.to_i
elsif operator == '4'
  result = number1.to_f / number2.to_f
else
  Kernel.puts("Invalid operator '#{operator}'!")
end

# compute and show result
Kernel.puts("The result is #{result}.")

