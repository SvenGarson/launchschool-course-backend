def running_total(list)
  accum = 0
  list.map { |v| accum += v }
end

def running_total_ewo(list)
  result = []
  accum = 0
  list.each_with_object(result){ |v, ar| ar << (accum += v) }
end

def running_total_inject(list)
  # iterate the list from 0 to n-1
  # add entry to new array for each running total
  # return new list
  run_totals = []
  list.size.times do |index|
    curr_total = list[(0..index)].inject(0) do |accum, v|
      accum + v
    end
    run_totals << curr_total
  end
  run_totals
end

puts "### First solution ###"
p running_total([2, 5, 13])          == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3])                 == [3]
p running_total([])                  == []

puts "### Using each_with_object ###"
p running_total_ewo([2, 5, 13])          == [2, 7, 20]
p running_total_ewo([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total_ewo([3])                 == [3]
p running_total_ewo([])                  == []

puts "### Using inject ###"
p running_total_inject([2, 5, 13])          == [2, 7, 20]
p running_total_inject([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total_inject([3])                 == [3]
p running_total_inject([])                  == []