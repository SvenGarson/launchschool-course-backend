=begin
  inp:
    - salary = (Int > 0)
    - bonus  = (Bool)
  out:
    - bonus for given salary:
      -> bonus false -> 0
      -> bonus true  -> bonus = (salary / 2)
  
  req:
    expl:
      - method name: calculate_bonus(salary, bonus)
      - bonus = half of salary
    impl:
      -? args alwas int
      -? integer or floating operation

=end

def calculate_bonus(salary, bonus)
  bonus ? (salary / 2) : 0
end

puts calculate_bonus(2800, true)  == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000