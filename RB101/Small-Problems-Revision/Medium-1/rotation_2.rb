=begin

inp:
1. Integer
2. last n digits to rotate
out:
- Integer with last n digits rotated

exp:
- can use rotate_array method from previous exercise
- n is in range [1; inf[

imp:
-? what if last n larger than count of digits

exploration:

  inp:
    number = 735291
    last n = 2
  out:
    result = 735219
  
  1. to char array: 735219 => %w(7 3 5 2 1 9)
  2. replace last n with rotated version
  3. join back to string
  4. to integer

dsal:

  >pseudo
  - chars = number.to_s.chars
  - rot = rotate(chars[last n])
  - chars replace last n with rot
  - chars = join to string
  - return chars to int

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

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917