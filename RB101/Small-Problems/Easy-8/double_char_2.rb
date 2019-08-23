=begin
  input:
    string
  output:
    - new string that has every consonant doubled and 
      vowels, digits and ponctuation not doubled

  requirements:
    explicit:
      - method named: double_consonants
      - argument: string
      - double every char apart:
        - vowels (a,e,i,o,u)
        - digits
        - ponctuation
        - whitespace

    implicit:
      -? which characters are white space, printing and non-printing
      -? which characters are ponctuation
      -? what exactly is a consonant

  ds and algo:

    - for every character in the char:
      - if allowed     -> replace current with double
      - if not allowed -> replace with the same character
    - create string
    - return string

=end

VOWELS = %w(A a E e I i O o U u)
DIGITS = ('0'..'9').to_a
PUNCT  = %w(. ! ? , ; : -)
WHITE  = [' ', "\t", "\n"].to_a
BLACKLIST = VOWELS + DIGITS + PUNCT + WHITE

def double_consonants(string)
  doubled = string.chars.map do |char|
    if BLACKLIST.include?(char)
      char
    else
      char * 2
    end
  end
  doubled.join
end

p double_consonants('String') == 'SSttrrinngg'
p double_consonants('Hello-World!') == 'HHellllo-WWorrlldd!'
p double_consonants('July 4th') == 'JJullyy 4tthh'
p double_consonants('') == ''