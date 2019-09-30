=begin

inp:
- positive Int
out:
- Int that is arg reversed

exp:
- don't accont for leading zeroes after conversion


dsal:
  
  >pseudo
  - repr = num to string
  - reverse repr
  - return repr

  inp: 456
  out: 654

    -  456  -> '456'
    - '456' -> '654'
    - '654' ->  654

=end

def reversed_number(num)
  num.to_s.reverse!.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1
