=begin

  inp: string

  out: sum of ascii code of each character in arg

  exp:
    - method name: ascii_value
    - can use String#ord to determine ascii code
    - empty string results in sum = 0

  ds and algo:
    
    - accum = 0
    - for each [char] in the string:
      - accum += [char].ord
    - return accum
      
    - new array mapped from character to ascii value
    - return sum of array objects

  further exploration:

    - The Integer#chr method return the string representaiton,
      i.e. the character that has the ascii code of the given
      Integer.

      The ord method return the ascii code of the given string,
      which, if it contains a string longer than 1 character,
      returns the ascii code of the first character in the
      string, so the 'string'.ord.chr method chain is the same
      as calling 's'.ord.chr.

=end

def ascii_value(str)
  str.chars.map { |char| char.ord }.reduce(0, :+)
end

p ascii_value('Four score')    == 984
p ascii_value('Launch School') == 1251
p ascii_value('a')             == 97
p ascii_value('')              == 0