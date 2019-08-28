def string_to_integer(str)
  mult = 1
  number = 0
  str.reverse.chars.each do |ch|
    dig = ch.ord - '0'.ord
    number += dig * mult
    mult *= 10
  end
  number
end

def is_digit?(ch)
  ('0'..'9').cover?(ch)
end

def string_to_signed_integer(str)
  sign = str[0]
  has_sign = !is_digit?(sign)
  str_range = has_sign ? (1..-1) : (0..-1)

  mult = (has_sign && sign == '-') ? -1 : 1
  number = string_to_integer(str[str_range]) * mult

end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100