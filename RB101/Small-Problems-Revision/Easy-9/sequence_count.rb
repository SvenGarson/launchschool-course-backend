=begin
  input:
    1. arg => count of the sequence
    2. arg => base number of sequence to multiply
  output:
    array that contains a sequence of products where:
      count = 3
      base = 2
      sequence = [1*3, 2*3, 3*3]
               = [3  ,   6,   9]
      the sequence length is equal to the count arg

  requirements:

    explicit:
      - method named: sequence
      - count arg >= 0
      - sequence is empty array if count is 0
      - sequence base can be any integer value
    implicit:


  ds and algo:
  
    - create new sequence array
    - iterate through the count range (1..count) through 'i':
      - add i * base to sequence array
    - return sequence array

=end

def sequence(count, base)
  seq_arr = []
  count.times { |i| seq_arr << (i+1)*base}
  seq_arr
end

p sequence(5, 1) == [1,2,3,4,5]
p sequence(4,-7) == [-7,-14,-21,-28]
p sequence(3, 0) == [0,0,0]
p sequence(0, 1000000) == []