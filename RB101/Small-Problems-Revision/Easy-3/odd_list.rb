def oddities(arr)
  result = []
  arr.each_with_index do |obj, index|
    result << obj if index.even?
  end
  result
end

def oddities_more(arr)
  indices = (0...arr.size).select { |i| i.even?}
  result = []
  indices.each { |i| result << arr[i]}
  result
end

def oddities_efficient(arr)
  index = 0
  result = []
  while index < arr.size
    result << arr[index]
    index += 2
  end
  result
end

puts '=== Solution A ==='
p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

puts '=== Solution B ==='
p oddities_more([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities_more([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities_more(['abc', 'def']) == ['abc']
p oddities_more([123]) == [123]
p oddities_more([]) == []

puts '=== Example Solution ==='
p oddities_efficient([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities_efficient([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities_efficient(['abc', 'def']) == ['abc']
p oddities_efficient([123]) == [123]
p oddities_efficient([]) == []