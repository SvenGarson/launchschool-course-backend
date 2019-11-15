class MinilangInvalidTokenError < StandardError

end

class MinilangStackError < StandardError
  def message
    'Minilang stack is empty!'
  end
end

class Minilang

  def initialize(minilang_program_string)
    @stack = Array.new
    self.register = 0
    self.tokens = tokenize(minilang_program_string)
  end

  def eval
    tokens.each do |token|
      # call n command if token is an integer
      if token.class == Integer
        n(token)
      else
        __send__(token)
      end
    end
  end

  private

  attr_accessor :register, :tokens

  def tokenize(minilang_program_string)
    minilang_program_string.downcase.split.map do |token_string|

      # invalid token throws MinilangInvalidTokenError
      unless valid_minilang_token?(token_string)
        raise MinilangInvalidTokenError, "'#{token_string}' is not a valid Minilang token!"
      end

      # cast N to type integer, other tokens stay of type string
      if valid_int_string?(token_string)
        token_string.to_i
      else
        token_string
      end    
    end
  end

  def n(register_replacement)
    self.register = register_replacement 
  end

  def push
    push_to_stack(register)
  end

  def add
    self.register = (register + pop_from_stack)
  end

  def sub
    self.register = (register - pop_from_stack)
  end

  def mult
    self.register = (register * pop_from_stack)
  end

  def div
    self.register = (register / pop_from_stack)
  end

  def mod
    self.register = (register % pop_from_stack)
  end

  def pop
    self.register = pop_from_stack
  end

  def print
    puts register.to_s
  end

  def push_to_stack(object)
    @stack.push(object)
  end

  def pop_from_stack
    if @stack.empty?
      raise MinilangStackError
    else
      @stack.pop
    end
  end

  def valid_minilang_token?(token)
    valid_int_string?(token) || respond_to?(token, true)
  end

  def valid_int_string?(string)
    string.to_i.to_s == string
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)

# erroneous programs
#Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB