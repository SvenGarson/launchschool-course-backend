=begin
  input:
    string
  output:
    new string that has heach character doubled

  requirements:
    explicit:
      method named: repeater
      argument: string
      return new string
      double each character in the string

    implicit:
      -? also double tabs and newlines

  ds and algo:

    - create new charactter array
    - for each char in the array:
      - replace character with the doubled version
    - doubled character array to string
    - return string

=end

def repeater(string)
  string.chars.map { |char| char * 2 }.join
end

p repeater('Hello') == 'HHeelllloo'
p repeater('Good job!') == 'GGoooodd  jjoobb!!'
p repeater('') == ''