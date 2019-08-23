=begin
  input:
    unordered array
  output:
    the duplicate value fomr the original array

  requirements:
    explicit:
      method named: find_dup
      inp array contains one value exactly twice and all
        the others exactly once

    implicit:
      ? type of data in array number/integer

  mental model:
    
    return the object that occurs twice in the original array

  ds and algo:

  create new hash with the default being zero
  for every object in the array:
    if not yet in the list -> add as key
    if in the list         -> increment count
    if count == 2 -> return that number

=end

def find_dup(array)
  count_hsh = Hash.new(0)
  obj_found = nil
  array.each do |elem|
    count = (count_hsh[elem] += 1)
    obj_found = elem
    break if count == 2
  end
  obj_found
end

p find_dup([1,5,3,1]) == 1
p find_dup([5,8,16,4,12,15,97,85,66,65,64,51,52,0,18,19,68,4]) == 4