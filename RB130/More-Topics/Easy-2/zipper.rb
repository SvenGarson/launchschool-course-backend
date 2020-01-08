def zip(array_left, array_right)
  zipped_array = Array.new(array_left.size)
  0.upto(zipped_array.size - 1) do |index|  
    zipped_array[index] = [array_left[index], array_right[index]]
  end
  zipped_array
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]