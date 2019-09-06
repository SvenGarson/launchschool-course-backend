=begin
  inp:
    Array of objects
  out:
    New array that contains every other element
    at places 1,3,5 etc. So from the first, every
    other element.

  req:
    exp:
      - method name: oddities
      - empty array as argument returns empty array
      
    imp:
      -? return new array
      -? return new or empty array when parameter
         array empty

  ds and algo:
  
  (1)
  - list = new array
  - index = 0
  - while index < array.size
    - list add array[index]
    - index += 2
  - return list

  Further exploration: -> Solve the exercise in at
  least 2 additional ways

  (2)
  - Same as (1) but iteration with step method

  (3)
  - list = new Array
  - Each object [o] with index [i]:
    - add to list if index even (0, 2, 4)
  - return list

=end

def oddities(arr)
  result = Array.new
  0.step(arr.size - 1, 2) { |i| result << arr[i]}
  result
end

def oddities_2(arr)
  result = Array.new
  index = 0
  while index < arr.size do
    result << arr[index]
    index += 2
  end
  result
end

def oddities_3(arr)
  result = Array.new
  arr.each_with_index do |obj, i|
    result << obj if i.even?
  end
  result
end

puts '### First solution using step method ###'
p oddities([2,3,4,5,6])    == [2,4,6]
p oddities([1,2,3,4,5,6])  == [1,3,5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123])          == [123]
p oddities([])             == []

puts '### Second solution using iteration ###'
p oddities_2([2,3,4,5,6])    == [2,4,6]
p oddities_2([1,2,3,4,5,6])  == [1,3,5]
p oddities_2(['abc', 'def']) == ['abc']
p oddities_2([123])          == [123]
p oddities_2([])             == []

puts '### Second solution using each_with_index and index oddity ###'
p oddities_3([2,3,4,5,6])    == [2,4,6]
p oddities_3([1,2,3,4,5,6])  == [1,3,5]
p oddities_3(['abc', 'def']) == ['abc']
p oddities_3([123])          == [123]
p oddities_3([])             == []