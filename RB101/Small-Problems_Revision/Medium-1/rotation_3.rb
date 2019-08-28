=begin
  
  input:
    int number
  output:
    maximum rotation of arg number:
      1) rotate number at first number
      2) rotate number staring at second number
      3) .... rd
      4) etc
      until final two digits have been rotated

    requir.:

      expl.:
        - method name: max_rotation
        - argument: int number
        - can use rotate_rightmost_digit method from previous exercise
        - don't need to handle multiple zero's

    test cases:

      inp: 105
      out: 015 (15 after casting to int)

      1) rotate 105          -> 051
      2) rotate 05 part only -> 015
      3) 015 to int          -> 15

    ds and algo:

      based on the functionality of the 'rotate_rightmost_digits' method  

      1) rotate the whole number
      2) rotate the th part after the first  digit
      3)    "                         second digit

      - rotate the number from the rightmost starting at all
        the digits, then stopping after rotating the last two
      
      algo:

        - start rot = count of digits
        - end   rot = 2
        - number to char array
        - from start_rot to end_rot(inclusive) through [curr]:
          - rotate char array for rightmost [curr]
        - char array back to string and integer
        - return result

    to preservse zero's:

      the zero gets lost once it it the left most place and converted to integer,
      so a method that works with a char array directly instead of an int and 
      casting it on return will fix this issue

=end

def rotate_array(arr)
  cpy = arr.dup
  if (tmp = cpy.shift)
    cpy.push(tmp)
  end
  cpy
end

def rotate_rightmost_digits(number, digits)
  dig_arr = number.to_s.chars
  rot_range = (-digits..-1)
  dig_arr[rot_range] = rotate_array(dig_arr[rot_range])
  dig_arr.join('').to_i
end

def rotate_rightmost_digits_arr(dig_arr, digits)
  rot_range = (-digits..-1)
  dig_arr[rot_range] = rotate_array(dig_arr[rot_range])
  dig_arr
end

def max_rotation(number)
  rot_number = number
  digits = number.to_s.length
  while digits >= 2 do
    rot_number = rotate_rightmost_digits(rot_number, digits)
    digits -= 1
  end
  rot_number
end

def max_rotation_2(number)
  number.to_s.length.step(2, -1) do |i|
    number = rotate_rightmost_digits(number, i)
  end
  number
end

def max_rotation_preserve_zeros(number)
  dig_arr = number.to_s.chars
  dig_arr.length.step(2, -1) do |i|
    dig_arr = rotate_rightmost_digits_arr(dig_arr, i)
  end
  dig_arr.join.to_i
end

puts '### Solution using while loop ###'
p max_rotation(735291) == 321579
p max_rotation(3)   == 3
p max_rotation(35)  == 53
p max_rotation(105) == 15
p max_rotation(8_703_529_146) == 7_321_609_845

puts '### Solution using step method ###'
p max_rotation_2(735291) == 321579
p max_rotation_2(3)   == 3
p max_rotation_2(35)  == 53
p max_rotation_2(105) == 15
p max_rotation_2(8_703_529_146) == 7_321_609_845

puts '### Solution that preserves zero using char array instead of casting to int ###'
p max_rotation_preserve_zeros(735291) == 321579
p max_rotation_preserve_zeros(3)    == 3
p max_rotation_preserve_zeros(35)   == 53
p max_rotation_preserve_zeros(1005) == 501
p max_rotation_preserve_zeros(8_703_529_146) == 7_321_609_845