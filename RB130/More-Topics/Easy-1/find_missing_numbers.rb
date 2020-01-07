def missing(sorted)
  missing_numbers = Array.new
  sorted.first.upto(sorted.last) do |number|
    missing_numbers << number unless sorted.include?(number)
  end
  missing_numbers
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []