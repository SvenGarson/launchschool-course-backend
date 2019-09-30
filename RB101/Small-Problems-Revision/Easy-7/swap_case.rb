=begin

inp:
- string
out:
- new string with swapped case

exp:
- return new string
- all non-alpha characters unchanged
- cannot use String#swapcase

imp:
-? does an empty string return a new empty string
-? can I write helper method

dsal:

  - res = new string
  - for each character:
    - if char is alpha
      - swap it
    - else
      - unchanged
  - return res

  - res = str copy
  - for every character in copy:
    - if alpha
      -> add swapped version to res 
    - else
      -> add as is to res
  - return res

=end

def is_alpha?(char)
  (char =~ (/[a-z]/i)) ? true : false 
end

def swap_case(char)
  if char == char.upcase
    char.downcase
  else
    char.upcase
  end
end

def swapcase(str)
  str.chars.map! do |char|
    if is_alpha?(char)
      swap_case(char)
    else
      char
    end
  end.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
p swapcase("I'm 27 years OLD!") == "i'M 27 YEARS old!"