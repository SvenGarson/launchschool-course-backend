=begin
  in:
    1) sorted array
    2) sorted array
  out:
    new array that merged the 2 sorted array index to index

  requir.:
    
    explic.:
      - method name: merge()
      - args:
        1) sorted array
        2) sorted array
      - cannot use sorting on resulting array
      - args are taken as sorted, so merge alternatingly at
        same indices:
          - index 0:
            - add lowest
            - add highes
            -> next index
      - do not mutate arrray, create a new one
      
    implic.:
      -! arrays not always the same size (tests given)
      -? can both array given be empty at the same time
      -? are object in the left parameter array always lower
         per sub-group

    exploration:
    
      - merged = new array
      - loop:
        - get list of first idem objects left
        - save index
        - same for right
        - save index
        - break if both lists empty
        - add lowest list first
        - add second list     
      - return merged

      - merged = new array
      - index L & R = 0
      - loop:
        - if left at index < right at index:
          -> merged << left at index for the same values + incr index
          -> same for right
        - else
          -> same swapped

    after looking at the solution:

      - merged = empty array
      - start index right = 0
      - for each current obj in the left array:
        - from start index to end in right array:
          - if R <= L:
            -> merged << R
            -> start_index = current index + 1
        - merged << curr
      - return merged
=end

def merge_2(arr_L, arr_R)
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

def merge(arr_L, arr_R)
  merged = []
  index_L = 0
  index_R = 0
  loop do
    tmp_L = arr_L[index_L..-1].select { |v| v == arr_L[index_L] }
    tmp_R = arr_R[index_R..-1].select { |v| v == arr_R[index_R] }
    index_L += tmp_L.length
    index_R += tmp_R.length
    break if tmp_L.empty? and tmp_R.empty?
    if not tmp_L.empty? and not tmp_R.empty?
      if tmp_L.first < tmp_R.first
        merged.concat(tmp_L.concat(tmp_R))
      else
        merged.concat(tmp_R.concat(tmp_L))
      end
    else
      merged.concat(tmp_L.concat(tmp_R))
    end
  end
  merged
end

puts '### First solution extracting information into sub-arrays ###'
p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2])    == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5])        == [1, 4, 5]
p merge([1, 4, 5], [])        == [1, 4, 5]

puts '### Second solution re-constructing the given solution ###'
p merge_2([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge_2([1, 1, 3], [2, 2])    == [1, 1, 2, 2, 3]
p merge_2([], [1, 4, 5])        == [1, 4, 5]
p merge_2([1, 4, 5], [])        == [1, 4, 5]