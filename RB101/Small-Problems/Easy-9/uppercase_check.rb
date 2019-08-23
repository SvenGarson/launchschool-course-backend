=begin
  input:
    string
  output:
    if all alpha characters in the string are uppercase -> true
    else                                                -> false

  requirements:

    explicit:
      - method named: uppercase?
      - string contains alpha and non-alpha characters, 
        hence the check
      - characters that are non-alpha are ignored in the check
      - empty string and string that do not contain any clpha
        character default to true (based on test 6)

    implicit:
      n/a

  mental model:

    return true if all the alphabetical characters in the strin are
    uppercase and false otherwise. non alphabetical characters are 
    ignored in the test
  
  ds and algo:

    If the string contains any alpha character that is not uppercase
    the string fails the test and the method returns false.

    - all upper = true
    - for every character in the string:
      - if char is alpha && downcase:
          all upper = false
          break
    - return all upper

    to check whether a character is downcase:

      char == char.downcase returns:
        true  if char is downcased
        false if char is uppercase

    After checking the solution:

      Indeed just checking if the string is the same after beeing
      upcased is the way to go

=end

ALPHA = ('a'..'z').to_a + ('A'..'Z').to_a

def uppercase?(string)
  all_upper = true
  string.chars.each do |char|
    if ALPHA.include?(char) && char == char.downcase
      all_upper = false
      break
    end
  end
  all_upper
end

def uppercase_2?(string)
  string.upcase == string
end

puts '### Iterative solution ###'
p uppercase?('t')          == false
p uppercase?('T')          == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!')    == true
p uppercase?('')           == true

puts '### Solution using String#upcase ###'
p uppercase_2?('t')          == false
p uppercase_2?('T')          == true
p uppercase_2?('Four Score') == false
p uppercase_2?('FOUR SCORE') == true
p uppercase_2?('4SCORE!')    == true
p uppercase_2?('')           == true