=begin
  input:
    two arrays to be merged
  output:
    new array containing the all but the duplicates 
    of the original arrays

  requirements:
    explicit:
      new array returned
      by the given test duplicated are also meant across the two arrays
      method called merge

    implicit:
      ? how to est equality simple by the ?? method ?
      we can actually use the + and uniq method, the uniq
      method uses eql? for comparison though

  mental model:
    Create new array that contains all the values from both passed
    arrays without allowing any duplicates.

  ds and algo:
    - create new array by adding them
    - strip doubles from the new array
    - return the new array

=end

def merge(arr_left, arr_right)
  (arr_left + arr_right).uniq
end

def merge_2(arr_left, arr_right)
  arr_left | arr_right
end

puts '### Solution using Array#+ and Array#uniq ###'
arr_left  = [1,3,5]
arr_right = [3,6,9]
arr_merged = merge(arr_left, arr_right)
p arr_merged.object_id != arr_left.object_id && arr_merged.object_id != arr_right.object_id
p merge([1,3,5], [3,6,9]) == [1,3,5,6,9]

puts '### Solution using Array#| or Array#union ###'
arr_left  = [1,3,5]
arr_right = [3,6,9]
arr_merged = merge_2(arr_left, arr_right)
p arr_merged.object_id != arr_left.object_id && arr_merged.object_id != arr_right.object_id
p merge_2([1,3,5], [3,6,9]) == [1,3,5,6,9]