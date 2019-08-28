=begin
  input:
    number
  
  output:
    - 2 times the arg if not a double number
    - 1 times the arg if it is a double number

  requirements:

    explicit:
      - method named: twice
      - a double number ...:
        - has an even count of digits
        - left half side same as right half side
        - both number halves have to match read left to right
        - examples double numbers   : 33, 4343, 103103
        - example non-double numbers: 103301, 1221
      - if arg double number - return as is
      - else return the number multiplied by 2

    implicit:
      -? how to handle zero, since 0 can be considered even
      -? how to handle negative arguments
      -? is input always >= 1
      -? arg number always ineger
    
  ds and algo:

    double number:
      number_even = arg.to_s.size.even? 
      number_in_range = (arg > 0)
      half_size = arg.to_s.size / 2
      split_left = arg.to_s[0..half_size]
      split_right = arg.to_s[half_size..-1]
      is double number = (split_left.to_i == split_right.to_i) + before

    twice method:

      if arg is double number -> return arg as is
      else                    -> return arg * 2

=end

def double_number?(number)
  num_str = number.to_s
  center = num_str.length / 2
  num_left  = num_str[0, center].to_i
  num_right = num_str[center, center].to_i
  number > 0 && num_str.length.even? && (num_left == num_right)
end

def twice(number)
  if double_number?(number)
    number
  else
    number *2
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10