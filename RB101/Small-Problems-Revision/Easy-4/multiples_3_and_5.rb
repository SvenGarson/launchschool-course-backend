=begin
  
  inp:
    - Int > 1
  out:
    - sum of multiples of 3 or 5 between 1
      and arg inclusive

  exp:
    - method name: multisum

  example(s):
    
    inp: 20
    out: 98

    inp: 10
    out: 33

    sum = 3 + 5 + 6 + 9 + 10 = 33

  ds and algo:

    - sum = 0
    - for every number in range (1..arg):
      - if multiple of 3 or 5
        -> sum += multiple
    - return sum

=end

def multiple_of_any?(number, multiples)
  multiples.any? { |mult| number % mult == 0 }
end

def multisum(ceiling)
  multiples = (1..ceiling).to_a.select do |num|
    multiple_of_any?(num, [3, 5])
  end
  multiples.reduce(:+)
end

p multisum(3)    == 3
p multisum(5)    == 8
p multisum(10)   == 33
p multisum(1000) == 234168