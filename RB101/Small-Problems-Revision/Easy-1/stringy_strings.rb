=begin
  inp:
    1) num = positive int
  out:
    - string of alternating 1's and 0's of length num
      starting with 1
  req:
    expl:
      - method name: stringy
      
  ds ans algo:

  - res = empty string
  - for i in range [1; num]:
    - if i odd  -> add 1 to res
    - if i even -> add 0 to res
  - return string

  further exploration:
  
  inp:
    1) num = positive int
    2) init (default to 1) which is 1 or 0 as int
  out:
    - string of alternating 1's and 0's of length num
      starting with init

  req:
    exp:
      - add parameter that is defaulted to 1
      - if set to zero, start sequence with 0 instead of 1

  ds and algo:

  - set initial number to the new arg
  - set secondary to 1 of init 0 and vice-versa
  - res = empty string
  - for i in range [1; num]:
    - if i odd  -> add init to res
    - if i even -> add  sec to res
  - return string

=end

def stringy(digits)
  bin_str = ''
  1.upto(digits) do |pos|
    bin_str << (pos.odd? ? '1' : '0')
  end
  bin_str
end

def stringy2(digits, prim=1)
  prim = prim.to_s
  sec = (prim == '1') ? '0' : '1'
  bin_str = ''
  1.upto(digits) do |pos|
    bin_str << (pos.odd? ? prim : sec)
  end
  bin_str
end

puts '### First solution for exercise ###'
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts '### First solution for further exploration ###'
puts stringy2(6)    == '101010'
puts stringy2(6, 0) == '010101'
puts stringy2(9)    == '101010101'
puts stringy2(9, 0) == '010101010'
puts stringy2(4)    == '1010'
puts stringy2(4, 0) == '0101'
puts stringy2(7)    == '1010101'
puts stringy2(7, 0) == '0101010'