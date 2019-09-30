=begin

inp:
1. count of sequence length
2. first number of seqence / base number

out:
- array of count numbers that are multiples of base

exp:
- returned array length equals count
- sequence contains multiples of base number
- negative base -> sequence grows in negative direction
- count >= 0
- base can by any integer

dsal:

  finding n multiples of base:

    n = 5
    base = 1

    - list = new array
    - accum = base
    - 5 times:
      - add accum to list
      - incre accum by base -> accum += base
    - return list

    if base positive:
      -> 1 + 1 = 2
      -> 2 + 1 = 3
    if negative:
      -> -1 + (-1) = -1 - 1 = -2
      -> -2 + (-1) = -2 - 1 = -3

  >shorter solution -> generating count multiples of
  - seq = empty array
  - for [i] in range (1..count):
    - multiple = i * base
    - seq << multiple
  - return seq

=end

def sequence(count, base)
  seq = []
  accum = base
  count.times do |_|
    seq << accum
    accum += base
  end
  seq
end

def sequence_2(count, base)
  (1..count).map { |i| i * base }
end

puts '### Solution using iteration ###'
p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []

puts '### Solution ranges and map ###'
p sequence_2(5, 1) == [1, 2, 3, 4, 5]
p sequence_2(4, -7) == [-7, -14, -21, -28]
p sequence_2(3, 0) == [0, 0, 0]
p sequence_2(0, 1000000) == []