=begin

inp:
- two arrays of possibly different size
out:
- array that contains all products of each
  possible combination sorted increasing

exp:
- return new array
- sorted increasing
- arrays always non-empty

exploration:

  inp:
    - [2, 4]
    - [4, 3, 1, 2]
  out:
    - [2, 4, 4, 6, 8, 8, 12, 16]

  combinations:
    2*4; 2*3; 2*1; 2*2
    4*4; 4*3; 4*1; 4*2

dsal:

  - generate combinations
  - res = new array
  - for each combination:
    - res << comb_L * comb_R
  - return res

  gen combos:
  
    inp:
      - a = [1, 2]
      - b = [3, 4]
      [1] -> [3, 4] --> [[1, 3], [1, 4]]
      [2] -> [3, 4] --> [[2, 3], [2, 4]]
    
    - combos = new array
    - for each a in a:
      - for each b in b
        combos << [a, b]

  - res = new array
  - for each combo a*b:
    - res << combo product
  - return res

=end

def multiply_all_pairs(arr_L, arr_R)
  res = []
  for a in arr_L
    for b in arr_R
      res << a * b
    end
  end
  res.sort
end

def multiply_all_pairs_prod(arr_L, arr_R)
  combos = arr_L.product(arr_R).map! { |combo| combo.first * combo.last }
  combos.sort
end

puts '### Solution using iteration ###'
p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
p multiply_all_pairs([1], [22, 66, 88]) == [22, 66, 88]

puts '### Using Array#product to generate combinations ###'
p multiply_all_pairs_prod([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
p multiply_all_pairs_prod([1], [22, 66, 88]) == [22, 66, 88]