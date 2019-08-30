=begin
  inp:
    1) list = non-empty array of positive integers
  out:
    - avg = int average of all int's in array as

  req:
    exp:
      - method name: average
      - use integer division -> see both tests given
  
    imp:
      -? use integer division or floating rounded or
         even floating point then cast to int

  ds and algo:

  - sum all ints in list
  - return sum / list.size

  
  further exploration:
  
  req:
    expl:
      - compute average as floating point

=end

def average(list)
  list.reduce(0, :+) / list.size
end

def average_flt(list)
  list.reduce(0.0, :+).fdiv(list.size)
end

puts '### First solution to exercise using Integer division ###'
puts average([1, 5, 87, 45, 8, 8])    == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

puts '### First solution to further exploration using floating point division ###'
puts average_flt([1, 5, 87, 45, 8, 8])
puts average_flt([9, 47, 23, 95, 16, 52])