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

CHTODIG = {
  '0' =>  0, '1' =>  1, '2' =>  2, '3' =>  3, '4' =>  4,
  '5' =>  5, '6' =>  6, '7' =>  7, '8' =>  8, '9' =>  9,
  'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14,
  'F' => 15
}

def string_to_integer_hsh(str)
  digits = str.chars.map{ |ch| CHTODIG[ch]}
  number = 0
  digits.each { |v| number = number * 10 + v }
  number
end

def hexadecimal_to_integer(str_hex)
  # convert to uppercase for A -> F
  str = str_hex.upcase
  digits = str.chars.map { |ch| CHTODIG[ch] }
  number = 0
  digits.each { |v| number = number * 16 + v}
  number
end

puts "### First solution ###"
p string_to_integer('4321') == 4321
p string_to_integer('570')  == 570

puts "### Solution with hash ###"
p string_to_integer_hsh('4321') == 4321
p string_to_integer_hsh('570')  == 570

puts "### Solution with hash for hexadecimal ###"
p hexadecimal_to_integer('ABC0')  == 43968
p hexadecimal_to_integer('ABC1')  == 43969