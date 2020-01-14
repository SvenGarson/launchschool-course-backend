=begin

vowels: IUEOA
conson: a-z - vowels

rules:
  - consonnant cluster moved ot end of string and add ay
  - vowel - just add ay to end of word and if consonant before
    add vowel to end before ay

  apple -> appleay
  ear -> earay
  pig -> igpay
  koala -> oalakay
  square -> aresquay
  therapy -> rapytheay

=end

class PigLatin

  VOWELS = %w(i u e o a)
  CONSONANTS = ('a'..'z').to_a - VOWELS

  def self.translate(english)
    if english.match? /\A[iueoa]+/
      english + 'ay'
    else
      consonant_group = english
    end
  end

end

p PigLatin.translate('square') == 'aresquay'