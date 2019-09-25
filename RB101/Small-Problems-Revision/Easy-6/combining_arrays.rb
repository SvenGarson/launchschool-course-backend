=begin

inp:
- 2 arrays
out:
- arg arrays merged
- duplicates removed

exp:
- return new array

dsal:

  - merged = new array
  - add first array to merged
  - add second array to merged
  - remove duplicates
  - return merged

=end

def merge(arr1, arr2)
  (arr1 + arr2).uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
p merge([], []) == []
p merge([1, 3, 5], []) == [1, 3, 5]
p merge([], [7, 8, 9]) == [7, 8, 9]
