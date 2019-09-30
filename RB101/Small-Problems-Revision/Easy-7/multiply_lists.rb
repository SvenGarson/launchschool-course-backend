=begin

inp:
- 2 array of same length
out:
- 1 new array that contains per index product

exp:
- both arg array have same size
imp:
-? return empty array if argument array empty

dsal:

  - res = new array of any arg array's size
  - for each [o] and [i]:
    - res[i] = arr1 * arr2 at that index
  - return res

=end

def multiply_list(arr_1, arr_2)
  res = Array.new(arr_1.length)
  for i in (0...res.length)
    res[i] = arr_1[i] * arr_2[i]
  end
  res
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
p multiply_list([], []) == []