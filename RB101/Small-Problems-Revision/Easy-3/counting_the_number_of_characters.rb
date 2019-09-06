=begin
  type: program

  flow:
    - Please write word or multiple words: -gets string
    - There are X characters in "string".

  inp:
    - one or more words as string
  out:
    - count of characters in the string

  req:
    exp:
      - spaces are not counted as character
      
    
    imp:
      -? input always space separated
      -? input string anlways non-empty
      -? space only white space in input or consider
         other whitespace characters
      -? no input validation

  ds and algo:

  - prompt for user input string
  - count all characters but space in the input string
  - print resulting count of characters
  --> format for exact i/o

=end

print 'Please write word or multiple words: '
inp = gets.chomp
char_count = inp.chars.count { |char| char != ' ' }
puts "There are #{char_count} characters in \"#{inp}\"."