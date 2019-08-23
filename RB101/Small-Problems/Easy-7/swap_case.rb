=begin
  input:
    string
  output:
    new string with character cases reversed/swapped

  requirements:
    explicit:
      method named: swapcase
      cannot use String#swapcase
      every character other than the ones swapped unchanged
    implicit:
      so we can use the upcase and downcase methods

  mental model:

    Create a new string with the same exact character but the lowercase
    chars converted to uppercase and vice-versa. then return that new string.

  ds and algo:

    create a new empty string
    for every character in the original array:
      if it is a  lowercase character -> add upcase version to string
      if it is an uppercase character -> add lowercase to string
      else -> add the character as is
    return the new string

=end

ALPHA_LOWERCASE = ('a'..'z').to_a
ALPHA_UPPERCASE = ('A'..'Z').to_a

def swapcase(string)
  swapped_ar = string.chars.map do |char|
                 if ALPHA_LOWERCASE.include?(char)
                   char.upcase
                 elsif ALPHA_UPPERCASE.include?(char)
                   char.downcase
                 else
                   char
                 end
               end
  swapped_ar.join
end

p swapcase('CamelCase')         == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'