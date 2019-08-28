=begin
  input:
    array of strings

  output:
    array of the same strings with vowels (a,e,i,o,u) removed

requirements:
  explicit:
    return array of the same string

  implicit:
     remove vowels that are upper and lowercase
    ? a different array can be returned but
    ? The string references have to be the same as the ones in
      the orig array? The line '... and returns an array of the same values ...'
      tells me either the same value as int character content or the object reference.

  mental model:
    Establish a new array and add every word in the passed word array with all
    the vowels (a,e,i,u,o) removed. Return this array.

  test cases:

  inp: ['abc', 'def', 'f512']
  out: ['bc',  'df',  'f512']

  abc  - a => bc
  def  - e => df
  f512     => f512
  
  result = ['bc', 'df', 'f512']

  data structure:
    Establish a new array to add the resulting strings to.
      Iterate the input array:
      new string to hold world = ''
        For every character in the current word:
          if vowel -> nothing
          if not vowel -> add character to new string
      add string to the new array
    
    return the array

    implementation:
      - return a new array
      - remove upper and lowercase vowels

=end

VOWELS = %w(a e i o u A E I O U)

def remove_vowels(str_ar)
  no_vowel_ar = []
  str_ar.each do |word|
    no_vowel_ar << word.chars.select{ |ch| !VOWELS.include?(ch)}.join
  end
  no_vowel_ar
end

def remove_vowels_2(str_ar)
  str_ar.map{ |word| word.delete(VOWELS.to_s) }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

p remove_vowels_2(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels_2(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels_2(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']