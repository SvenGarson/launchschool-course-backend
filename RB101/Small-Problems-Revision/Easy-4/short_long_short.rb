=begin
  inp:
    1) string
    2) string
  out:
    - string of format short+long+short

  exp:
    - method name: short_long_short
    - parameters different lengths
    - at least one parameter can be empty string
    - concatenate new string short then long then short

  ds and algo:

    - create array with both string
    - sort by by increasing string lengths
    - return new string first+second+first object in sorted array

=end

def short_long_short(str1, str2)
  asc = [str1, str2].sort_by { |str| str.length }  
  asc.first + asc.last + asc.first
end

p short_long_short('abc', 'defgh') == 'abcdefghabc'
p short_long_short('abcde', 'fgh') == 'fghabcdefgh'
p short_long_short('', 'xyz')      == 'xyz'