=begin

  commentary:
  -----------

  - to change language change the 'lang_filename' in 'config.json' to
    another provided file like 'lang_EN.json' .
  - some bad characteristics of the program:
    - does not check for division by zero
    - initilization of global constant by return value of method
    - extensive use of exit to quit the program on error
    - error messages in english only
    - ...
  - some good characteristics of the program
    - exits and gives feedback on what caused the program to quit
      which can be missing or malformed config.json and/or language json files
    - has independent language files that can be added
    - ...
  I will leave this program as is since it is very early on and shows
  what happens when code, that you think is OK, is modified to accomodate
  a feature, like loading messages from a configuration file without planning.
=end

# method definitions
def load_gems
  # load json gem
  loaded = require 'json'
  if !loaded
    puts "=> Error loading json gem. Exiting..."
    exit
  end
end

def init_language
  # variables
  lang_filename = nil
  lang_obj = nil
  # load config json
  begin
    config_str = File.read('config.json')
    config_obj = JSON.parse(config_str)
    lang_filename = config_obj['lang_filename']
  rescue
    puts "=> Error loading/parsing config.json! Exiting..."
    exit
  end

  # load language json for prompt to use
  begin
    lang_str = File.read(lang_filename)
    lang_obj = JSON.parse(lang_str)
  rescue
    puts "=> Error loading/parsing lang_*.json! Exiting..."
    exit
  end
  # return language hash map
  lang_obj
end

def lookup(msg_type)
  # check if language has has key
  if !MSG_LOOKUP.key?(msg_type)
    puts "=> Error loading message from language hash. Exiting..."
    exit
  end
  # get and return the msg from language lookup hash
  MSG_LOOKUP[msg_type]
end

def prompt(msg_type, *args)
  # get the msg from language lookup hash
  # but duplicate the reference received from the hash
  msg = String.new(lookup(msg_type))
  # check enough arguments to match '#'
  pound_count = msg.count('#')
  if args.size < pound_count
    puts "=> Not enough arguments to 'prompt()'. Exiting..."
    exit
  end
  # replace pounds with arguments
  pound_count.times do |index|
    msg.sub!('#', args[index].to_s)
  end
  # print msg
  puts "=> #{msg}"
end

def valid_integer?(integer)
  integer.to_i.to_s == integer
end

def valid_float?(float)
  float.to_f.to_s == float
end

def number?(number)
  valid_integer?(number) || valid_float?(number)
end

def operation_to_message(operator)
  msg = case operator
        when '1' then lookup('MSG_ADD')
        when '2' then lookup('MSG_SUB')
        when '3' then lookup('MSG_MULT')
        when '4' then lookup('MSG_DIV')
        end
  # some more code here eventually ...

  # 'explicitly' return the message
  msg
end

# load gems
load_gems

# initialize language from configuration file
# and use as constant lookup for prompt method
MSG_LOOKUP = init_language

# prompt greeting and input
prompt('MSG_WELCOME')

# get valid name
name = nil
loop do
  name = Kernel.gets().chomp()
  # ask again if name has zero length
  if name.empty?
    prompt('MSG_ERR_NAME')
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
    prompt('MSG_FIRST_NUMBER')
    number1 = Kernel.gets().chomp()
    if number?(number1)
      break
    else
      prompt('MSG_ERR_NUMBER')
    end
  end

  # get valid second number
  loop do
    prompt('MSG_SECOND_NUMBER')
    number2 = Kernel.gets().chomp()
    if number?(number2)
      break
    else
      prompt('MSG_ERR_NUMBER')
    end
  end

  # get operator
  prompt('MSG_OPERATOR')

  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('MSG_ERR_OPERATOR')
    end
  end

  # confirm operation chosen
  prompt('MSG_OPERATION', operation_to_message(operator))

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
  prompt('MSG_RESULT', result)

  # prompt for another run
  prompt('MSG_ANOTHER_CALC')
  answer = Kernel.gets().chomp()

  # keep looping if answer starts with anything else than 'y'
  break unless answer.downcase().start_with?(lookup('MSG_YES'))
end

# goodbye message
prompt('MSG_GOODBYE', name)
