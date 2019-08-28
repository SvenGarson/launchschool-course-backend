=begin
  input:
    non-empty string
  output:
    - if input string odd  -> center character
    - if input string even -> two center characters

  requirements:
    explicit:
      - method name: center_of
      - argument: string >= 1 characters long

    implicit:
      - return a new string with either the one or two center
        characters based on the oddity

  mental model:

    Return a new string containing the center character if the
    string length is odd and the two center characters if the
    string is even

  test cases:

    inp: 'I love ruby' -> 11 characters
    out: 'e'

      inp.size = 1
      index of char to return is 11 / 2 = 5
      inp[5] = 'e'
      chars returned = 1

    inp: 'Launch' -> 6 characters
    out:  'un'

      inp.size = 6
      index of first char to return = 6 / 2 - 1 = 3 - 2 = 2
      inp[2] = 'u'
      inp[2+1] = 'n'
      chars returned = 2

  ds and algo:

    - size = arg_str.size
    - if size == odd
        -> center characters = arg_str[size / 2]
    - if size == even
        -> center characters = arg_str[(size/2)-1, 2 characters]
    - return center characters

=end

def center_of(string)
  center_index = string.size / 2
  if string.size.odd?
    string[center_index]
  else
    string[center_index-1, 2]
  end
end

p center_of('I love ruby')   == 'e'
p center_of('Launch School') == ' '
p center_of('Launch')        == 'un'
p center_of('Launchschool')  == 'hs'
p center_of('x')             == 'x'