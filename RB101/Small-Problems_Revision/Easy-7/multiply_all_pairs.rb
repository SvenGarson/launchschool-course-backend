=begin
  input:
    two arrays of number of which both are non-empty
  output:
    new array of numbers that contains each possible product
      of pairs between the two arrays sorted by increasing value

  requirements:
    explicit:
      method named: multiply_all_pairs
      return new array
      takes 2 array as argument
      sorted by increasing values, i.e lowest to highest value

    implicit:
      n/a

  mental model:

    Take 2 non-empty arrays of numbers and return a new array that
    contains all possible pairs of numbers between the two arrays and
    sort it by from lowest to highest value

  ds and algo:

    - create new empty array
    - for each number in the first array = F:
        - for each number in the second array = S per number in the first:
          - add F*S to the new array
    - sort array from lowest to highest
    - return the array

=end

def multiply_all_pairs(array_1 ,array_2)
  pair_accum = []
  array_1.each do |outer|
    array_2.each do |inner|
      pair_accum << (outer * inner)
    end
  end
  pair_accum.sort!
end

def multiply_all_pairs_2(array_1, array_2)
  array_1.product(array_2).map { |comb| comb.first * comb.last }.sort!
end

puts '### Solution using iterators ###'
p multiply_all_pairs([2, 4], [4,3,1,2]) == [2,4,4,6,8,8,12,16]

puts '### Solution using the product and map method ###'
p multiply_all_pairs_2([2, 4], [4,3,1,2])  == [2,4,4,6,8,8,12,16]