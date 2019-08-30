=begin
  inp:
    1) num = positive int
  out:
    - array of int's from left to right

  req:
    expl:
      - method named: digit_list
      - list of digits form left to right

  ds and algo:
    
  - number to string
  - string to char arr
  - chars to int representation

=end

def digit_list(num)
  num.to_s.chars.map { |char| char.to_i}
end


puts digit_list(12345)  == [1, 2, 3, 4, 5]
puts digit_list(7)      == [7]
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list(444)    == [4, 4, 4]