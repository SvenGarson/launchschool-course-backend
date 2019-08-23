=begin
  input:
    int number
    count of last digits to rotate
  output
    int number with digits rotated
  
  requir.:

    expl.:
      - method name: rotate_rightmost_digits
      - can use rotate_array from previous exercise
      - if second arg 1 -> original number is returned
      - n is always > 0

    impl.L
      -? always int
      -? n always <= count of digits

  mental model:

    Take the integer and rotate the last n (2nd arg) numbers
    the way as if they were split from the whole number, the
    first digit removed from the beginning and added to the end,
    then reconstruct the number and return it

  test cases:

    inp:
      number: 735291
      last n: 1
    out:
      735291

      - cast number to char array
      - create left and right portion (n digits/characters) of the array
      - rotate right portion in place
      - merge the two array back together
      - convert back to string and integer
      - return rotate the integer

    2nd appproach:

      - cast number to char array
      - replace last n chars in char array with the rotated version
      - join string and to integer
      - return that integer    

=end

def rotate_array(arr)
  cpy = arr.dup
  if (tmp = cpy.shift)
    cpy.push(tmp)
  end
  cpy
end

def rotate_array!(arr)
  if (tmp = arr.shift)
    arr.push(tmp)
  end
  arr
end

def rotate_rightmost_digits(number, digits)
  ch_arr = number.to_s.chars
  left, right = ch_arr[0, ch_arr.length - digits], ch_arr[-digits, digits]
  rotate_array!(right)
  left.concat(right).join('').to_i
end

def rotate_rightmost_digits_2(number, digits)
  dig_arr = number.to_s.chars
  rot_range = (-digits..-1)
  dig_arr[rot_range] = rotate_array(dig_arr[rot_range])
  dig_arr.join('').to_i
end

puts '### First solution using parallel assignment ###'
p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

puts '### Second solution using element assignment ###'
p rotate_rightmost_digits_2(735291, 1) == 735291
p rotate_rightmost_digits_2(735291, 2) == 735219
p rotate_rightmost_digits_2(735291, 3) == 735912
p rotate_rightmost_digits_2(735291, 4) == 732915
p rotate_rightmost_digits_2(735291, 5) == 752913
p rotate_rightmost_digits_2(735291, 6) == 352917