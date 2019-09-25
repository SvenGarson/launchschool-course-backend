=begin

  inp:
  - strar = array of string
  out:
  - string array with the same value but vowels removed

  exp:
  - method name: remove_vowels
  - vowels to remove: a e i o u
  - vowels are removed whether they are upper or lowercase

  imp:
  -? return new or the same string as parameter
  -? if a string contains only vowels the resulting
     string is empty
  
  ds and algo:

    - for each string in strar:
      - delete all uppercase and lowercase vowels
    - return the strar

=end

def remove_vowels(strar)
  strar.each do |str|
    str.gsub!(/[aeiou]/i, '')
  end
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']