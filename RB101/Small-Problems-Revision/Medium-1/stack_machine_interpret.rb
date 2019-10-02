=begin

inp:
- string -> space separated commands
out:
- output of minilang on 'PRINT' command

exp:
- stack based -> LIFO
- each operation -> register & stack
- 2 operands and operatoin order
	-> register = (register OP stack.pop)
- all operations INTEGER operations
- arg command string valid to run without validation
- initialize register with Int 0
- [n] command can contain negative and positive integers
- commands:
	- [int]  => REG = [n]
	- [PUSH] => push REG value to STACK, REG keeps value
	- [ADD]  => REG = (REG + STACK.pop)
	- [SUB]  => REG = (REG - STACK.pop)
	- [MULT] => REG = (REG * STACK.pop)
	- [DIV]  => REG = (REG / STACK.pop)
	- [MOD]  => REG = (REG % STACK.pop)
	- [POP]  => REG = STACK.pop
	- [PRINT]  => puts REG

imp:
-? so all operations without conversion, straight up use
   the desired operator on Initeger operands
-? need to handle zero [n] integers 
-? need to handle division by zero

exploration:

	valid int token test, if token is a string
		-> token.to_i.to_s == token

dsal:

	>init
	- split strings into token array
	- differentiate between string and integer tokens
	- for each token in split:
		- execute operation
	- done

	>impl
	- stack = 0
	- tokens = split cmd string
	- for each token:
		- if token valid int:
			-> execute [n] command
		else:
			-> execute other command based on string
	- done

further exploration:

	- write a program that translates operators and operans
	  into a valid minlang program

	- commands are:
		- [int]  => REG = [n]
		- [PUSH] => push REG value to STACK, REG keeps value
		- [ADD]  => REG = (REG + STACK.pop)
		- [SUB]  => REG = (REG - STACK.pop)
		- [MULT] => REG = (REG * STACK.pop)
		- [DIV]  => REG = (REG / STACK.pop)
		- [MOD]  => REG = (REG % STACK.pop)
		- [POP]  => REG = STACK.pop
		- [PRINT]  => puts REG


	- tokens are:
		- integers
		- parentheses ()
		- operators + - * / %

=end

def print_divider
	puts '-'*25
end

def valid_int_token?(cmd_str)
	cmd_str.to_i.to_s == cmd_str
end

def minilang(cmd_str)
	reg = 0
	stack = []
	tokens = cmd_str.split(' ')
	for tok in tokens
		if valid_int_token?(tok)
			reg = tok.to_i
		else
			case tok
			when 'PRINT' then puts reg
			when 'PUSH'  then stack.push(reg)
			when 'POP'   then reg = stack.pop
			when 'ADD'   then reg = (reg + stack.pop)
			when 'SUB'   then reg = (reg - stack.pop)
			when 'MULT'  then reg = (reg * stack.pop)
			when 'DIV'   then reg = (reg / stack.pop)
			when 'MOD'   then reg = (reg % stack.pop)
			end
		end
	end
end

minilang('PRINT')
print_divider
# 0

minilang('5 PUSH 3 MULT PRINT')
print_divider
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
print_divider
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
print_divider
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
print_divider
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
print_divider
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
print_divider
# 12

minilang('-3 PUSH 5 SUB PRINT')
print_divider
# 8

minilang('6 PUSH')
print_divider
# (nothing printed; no PRINT commands)