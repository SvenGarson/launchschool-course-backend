=begin
  input:
    method name: sum_of_sums
    arg: array of numbers
  output:
    sum of the sums of each leading subsequence:
      [1] + [1]+[2] + [1]+[2]+[3] etc

  requirements:
    explicit:
      - arg array contains at least one number
    implicit:
      - given by the test numbers are integer
      - ? need to handle float, as type beeing integer
          is not explicitely stated


  ds and algo:

  1st appproach:

    accum = 0
    for max index in range (0...arg_array.size):
      for sub index in range (0..max_index):
        accum += arg_array[sub index]
    return accum

  2nd approach:
    
    accum = 0
    last sum = 0
    for index in (0...arg_array.size):
        last sum += arg_array[index]
        accum += last
    return accum

    test:

      inp: [1, 3, 5]
      out: 1 + (1 + 3) + (1 + 3 + 5) = 1 + 4 + 9 = 14

      iterate from 0 to 2 inclusive:

      1st iter, index 0:
        last sum = 0 + 1 = 1
        accum = 0 + 1 = 1

      2nd iter, index 1:
        last sum = 1 + 3 = 4
        accum = 1 + 4 = 5

      3rd iter, index 2:
        last sum = 4 + 5 = 9
        accum = 5 + 9 = 14

  3rd approach:

    accum = 0
    for count = numer of numbers to count 
      accum += sum of first count object
    return accum

=end

def sum_of_sums_4(num_arr)
  # using u to and inject / reduce
  accum = 0
  1.upto(num_arr.size) do |count|
    accum += num_arr.slice(0, count).reduce(:+)
  end
  accum
end

def sum_of_sums_3(num_arr)
  # because rubyist's like each so much ...
  # it actually makes things simpler ...
  last_sum = 0
  accum = 0
  num_arr.each do |num|
    last_sum += num
    accum += last_sum
  end
  accum
end

def sum_of_sums_2(num_arr)
  last_sum = 0
  accum = 0
  for i in (0...num_arr.size) do
    last_sum += num_arr[i]
    accum += last_sum
  end
  accum
end

def sum_of_sums(num_arr)
  accum = 0
  for max_index in 0...num_arr.size
    for sub_index in 0..max_index
      accum += num_arr[sub_index]
    end
  end
  accum
end

puts '### First solution using nested iteration ###'
p sum_of_sums([3,5,2])     == 21
p sum_of_sums([1,5,7,3])   == 36
p sum_of_sums([4])         == 4
p sum_of_sums([1,2,3,4,5]) == 35

puts '### Second solution using single iteration ###'
p sum_of_sums_2([3,5,2])     == 21
p sum_of_sums_2([1,5,7,3])   == 36
p sum_of_sums_2([4])         == 4
p sum_of_sums_2([1,2,3,4,5]) == 35

puts '### Third solution using single iteration and Array#each ###'
p sum_of_sums_3([3,5,2])     == 21
p sum_of_sums_3([1,5,7,3])   == 36
p sum_of_sums_3([4])         == 4
p sum_of_sums_3([1,2,3,4,5]) == 35

puts '### Fourth solution using single upto and reduce/inject ###'
p sum_of_sums_4([3,5,2])     == 21
p sum_of_sums_4([1,5,7,3])   == 36
p sum_of_sums_4([4])         == 4
p sum_of_sums_4([1,2,3,4,5]) == 35