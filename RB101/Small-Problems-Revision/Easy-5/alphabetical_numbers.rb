=begin

  inp:
    - Array on Integers in range (0..19)
  out:
    - an Array of these integers sorted based on
      their english word number equivalent

  exp:
    - method name: alphabetic_number_sort
    - sort by using the built in comparison for strings
      of the english word for the given number 
  imp:
    -? does '... returns an Array ...' mean a new array
      
  ds and algo:

    - sorted = sort array by
    - return sorted 

=end

NUM_STR = [
  %w(zero one two three four five six seven eight nine ten eleven twelve),
  %w(thirteen fourteen fifteen sixteen seventeen eighteen nineteen)
].flatten.freeze

def alphabetic_number_sort(int_arr)
  int_arr.sort_by { |num| NUM_STR[num] }  
end

def alphabetic_number_sort_simple(int_arr)
  int_arr.sort do |numL, numR|
    NUM_STR[numL] <=> NUM_STR[numR]
  end
end


puts '### Solution using sort_by ###'
p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

puts '### Solution using sort ###'
p alphabetic_number_sort_simple((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]