=begin
  input:
    string of space separated commands -> see explicit requir
  output:
    only output generated by the PRINT command

  requirements:

    explic.:
      - method name: minilang
      - argument: space separated commands/integer
      - stack based -> LIFO
      - commands:
         [n]    : replace register with [n]
         [PUSH] : register -> stack | register stays
         [ADD]  : register += stack.pop
         [SUB]  : register -= stack.pop
         [MULT] : register *= stack.pop
         [DIV]  : register /= stack.pop
         [MOD]  : register %= stack.pop
         [POP]  : register  = stack.pop
         [PRINT]: print register value, one per line
      - register and operations are integers
      - all program arguments are assumed valid both syntactically
        and range whise for pushing and popping to and from the stack
      - init the register to zero

    implic.:
      -! differentiate between string and number commands

  mental model:

    take the valid program string and execute the commands from left
    to right where the only output happend when the PRINT command is
    entered and print the output on a new line

  ds and algo:

    program state:
      - stack
      - register

    - we can assume that the programm entered is valid

    - init stack to zero
    - for every substring in the program string:
      - if integer -> [n]
      - if string  -> [xyz]

=end

class Minilang

  def initialize(register_value)
    @register = register_value
    @stack = []
  end

  def n(value)
    @register = value
  end

  def push
    @stack.push(@register)
  end

  def add
    @register += @stack.pop
  end

  def sub
    @register -= @stack.pop
  end

  def mult
    @register *= @stack.pop
  end

  def div
    @register /= @stack.pop
  end

  def mod
    @register %= @stack.pop
  end

  def pop
    @register = @stack.pop
  end

  def print
    puts @register
  end

end

def strint?(num_str)
  num_str.to_i.to_s == num_str
end

def gen_typed_cmd_list(cmd_string)
  cmd_string.split(' ').map do |str|
    if strint?(str)
      str.to_i
    else
      str.downcase
    end
  end
end

def minilang(cmd_string)
  machine = Minilang.new(0)

  gen_typed_cmd_list(cmd_string).each do |cmd|
    if cmd.class == String
      machine.__send__(cmd) if machine.respond_to?(cmd)
    else
      machine.n(cmd)
    end
  end
  
end

puts '--------'
minilang('PRINT')
puts '--------'
minilang('5 PUSH 3 MULT PRINT')
puts '--------'
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
puts '--------'
minilang('5 PUSH POP PRINT')
puts '--------'
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
puts '--------'
minilang('3 PUSH PUSH 7 DIV MULT PRINT')
puts '--------'
minilang('4 PUSH PUSH 7 MOD MULT PRINT')
puts '--------'
minilang('-3 PUSH 5 SUB PRINT')
puts '--------'
minilang('6 PUSH')



