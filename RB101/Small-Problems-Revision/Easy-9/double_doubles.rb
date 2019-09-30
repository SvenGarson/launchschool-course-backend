=begin

inp:
- Int
inp
- number or number X 2

exp:
- double number is:
  -> even amount of digits
  -> left half equals right half (NOT MIRRORED)
- return :
  -> arg is double number  --> return number as is
  -> arg not double number --> return number X 2

dsal:

  >determine if number is double:
  - str_repr = number to string
  - if char count even and first hald == second half:
    -> true
  - else:
    -> false

  inp: 103103
  out: true

    103103 = '103103' -> even is true
    n = 6
    half = 3
    rng left  = (0, 3) => '103'
    rng right = (3, 3) => '103'

=end

def is_double?(num_str)

  return false if num_str.length.odd?

  center = (num_str.length / 2).floor
  part_left  = num_str[0, center]
  part_right = num_str[center, center]

  part_left == part_right
end

def twice(number)
  nstr = number.to_s
  is_double?(nstr) ? number : (number * 2)
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