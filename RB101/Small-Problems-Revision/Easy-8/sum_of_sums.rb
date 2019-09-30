=begin

inp:
- array of at leat 1 number
out:
- sum of running sums

dsal:

  >using accumulators:
  - accum = 0
  - base = 0
  - for each number:
    - base += number
    - accum += base
  - return accum

  >using iteration:
  - accum = 0
  - for i in range [0; numbers.length [:
    - sum = numbers from index [0; 1]
    - accum +) sum
  - return accum

=end

def sum_of_sums(numbers)
  accum = 0
  base = 0
  numbers.each do |num|
    base += num
    accum += base
  end
  accum
end

def sum_of_sums_iter(numbers)
  accum = 0
  for iend in (0...numbers.length)
    accum += numbers[0..iend].reduce(:+)
  end
  accum
end

puts '### Solution using accumulators ###'
p sum_of_sums([3, 5, 2]) == 21
p sum_of_sums([1, 5, 7, 3]) == 36
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

puts '### Solution using iteration ###'
p sum_of_sums_iter([3, 5, 2]) == 21
p sum_of_sums_iter([1, 5, 7, 3]) == 36
p sum_of_sums_iter([4]) == 4
p sum_of_sums_iter([1, 2, 3, 4, 5]) == 35