=begin
  in:
    1) dig = int [1; +inf]
  out:
    - sum of dig digits

  req:
    expl:
      - method name: sum()
      - challenge: can't use while; until; loop; each

  ds and algo:

  - number to string
  - number to char array
  - sum each char.to_i

=end

def sum(num)
  num.to_s.chars.reduce(0) { |accum, dig| accum + dig.to_i}
  # num.to_s.chars.map(&:to_i).reduce(:+)
end

puts sum(23)       == 5
puts sum(496)      == 19
puts sum(123_456_789) == 45