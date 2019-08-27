=begin

  in:
    - array ontianing one type of object
      string or integer
  out:
    - sorted list using merge sort

  requir.:
  
    explic.:
      - method name: merge_sort
      - arg        : array of all integers or all string
      - return     : new array sorted by merge sort
  
    implic.:
      -? do not mutate as previous before
      -? return new array as previous exercise 
      -? input arrays always non-empty

    exploration:
    
      in:  [9, 5, 7, 1]
      out: [1, 5, 7, 9]

      1) split array in half [9, 5] & [7, 1]
      

      1L) split [9, 5] in half [9] & [5]
      2L) cant split size 1 -> return ar
      1L) 

      1R) split [7, 1] in half [7] & [1]
      2R) cant split size 1 -> return ar

    splitting arrays:

      even size 4 dat = [1, 2, 3, 4]:
      center = arr.size / 2 = 4 / 2 = 2
        1. split: arr[0...2] ==> [1, 2]
        2. split: arr[2..-1] ==> [3, 4]

      odd size 3 dat = [1, 2, 3]
      center = 3 / 2 = 1
        1. split: arr[0...1] ==> [1]
        2. split: arr[1..-1] ==> [2, 3]

    ds and algo:

      - return array if size 1
      - split as evenly as possible into splitL and splitR
      - merge(merge_sort(split_L), merge_sort(split_R))

=end

def merge(arr_L, arr_R)
  merged = []
  index_search = 0
  arr_L.each do |left|
    index_search.upto(arr_R.size-1) do |i|
      right = arr_R[i]
      break if right > left
      merged << right
      index_search = i + 1
    end
  merged << left
  end
  merged + arr_R[index_search..-1]
end

def merge_sort(arr)
  return arr if arr.size == 1
  split_L, split_R = arr[0...arr.size/2], arr[arr.size/2..-1]
  merge(merge_sort(split_L), merge_sort(split_R))
end

p merge_sort([9, 5, 7, 1])    == [1, 5, 7, 9]
p merge_sort([5, 3])          == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) ==
  [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]