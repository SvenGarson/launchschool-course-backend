=begin
  input:
    string that contains alphanumerical and non-alphanumeric characters
  output:
    string that has every other character capitalized

  requirements:
    explicit:
      method named: staggered_case
      returns a new string
      new string always start with capitalized/upcased character
      non alphanumeric characters also count for the alternating pattern
    implicit:
      the second and third test show that the first character in the new string,
      i.e the alternating pattern starts with an uppercase character (if it is
      a character) in the first place

  mental model:

    Create a new string where every character is first downcased (if alpha char)
    and then alternatingly upcased, starting with uppercase for the first character
    until the end. The alternating pattern also includes the non alphabetical characters.

  ds and algo:

    - create new string that contains the original string downcased
    - map every character at an index divisible by two (without remainder) upcase
      starting at zero
    - return the new string

=end

def staggered_case(string)
  staggered = string.downcase
  staggered.chars.each_with_index { |char, index| char.upcase! if index.even? }.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'