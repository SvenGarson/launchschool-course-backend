=begin

inp:
- integer
out:
- max rotated number integer

exp:
- can use rotate_rightmost_digits from previous exercise
- ok if zero's are dropped
- no need to handle multiple zero's

exploration:

  inp: 735291
  out: 321579

  1. 352917
  2. 329175
  3. 321759
  4. 321597
  5. 321579
  
  inp: 105
  out: 15

  1. 051 -> 51
  2. 51  -> 15

dsal:

  >pseudo
  - number = arg
  - digit_count = number.to_s.length
  - iterate [digits] from digit_count to 2 inclusive:
    - number = rotate_rightmost_of(number, digits)
  - return number

Further exploration:

  - include edge case where we don't drop the zero'z
    until the end if the resulting rotated number is
    converted to an integer from string

  Instead of rotating a number, which means int to char array,
  rotate and back to an integer, where the zero's are dropped,
  rotate the character array until all rotations are done, and
  the convert back to int.
  
  >pseudo adjusted to not drop zero's until the end
  - num_char_ar = number.to_s.chars
  - digit_count = num_char_ar.length
  - iterate [digits] from digit_count to 2 inclusive:
    - rotate_rightmost_digits(num_char_ar) in place
  - number = num_char_ar.join.to_i
  - return number

=end

def rotate_array(arr)
  cpy = arr.dup
  return cpy if cpy.length <= 1
  
  cpy << cpy.shift
end

def rotate_rightmost_digits(number, last_n)
  num_chars = number.to_s.chars
  affect_range = (-last_n..-1)
  end_rotated = rotate_array(num_chars[affect_range])
  num_chars[affect_range] = end_rotated
  num_chars.join.to_i
end

def rotate_rightmost_digits_ar!(strar, last_n)
  affect_range = (-last_n..-1)
  strar[affect_range] = rotate_array(strar[affect_range])
  strar
end

def max_rotation(number)
  digits = number.to_s.length
  digits.downto(2) do |last_n|
    number = rotate_rightmost_digits(number, last_n)
  end
  number
end

puts '### Solution to initial exercise ###'
p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

