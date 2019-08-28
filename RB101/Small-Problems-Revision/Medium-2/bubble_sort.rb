=begin
  inp:
    some array at least 2 elements
  out:
    same array reference, sorted in place -> mutated

  requir.:

    explic.:
      - method name: bubble_sort!
      - arg        : array containing at least 2 elements
      - array is mutated

    implic.:
      -? which method to use for lower/higher testing
      -! use the built in .>() method for now
      -? what does the method return exactly, arg array,
         nil, ...

  ds and algo:

    - dirty = true
    - while array dirty:
      - dirty = false
      - iterate array from 0 to n-2 through i:
        - left  = array[i+0]
        - right = array[i+1]
        - if right < left:
          -> swap objects
          -> set dirty
    - return arg array

=end

def bubble_sort!(array)
  dirty = true
  while dirty do 
    dirty = false
    0.upto(array.size-2) do |i|
      left = array[i]
      right = array[i+1]
      if right < left
        array[i], array[i+1] = right, left
        dirty = true
      end
    end
  end
  array
end

def bubble_sort_2!(array)
  loop do
    dirty = false
    0.upto(array.size-2) do |i|
      left = array[i]
      right = array[i+1]
      if right < left
        array[i], array[i+1] = right, left
        dirty = true
      end
    end
    break if not dirty
  end
  array
end

puts '### First solution ###'
array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

puts '### Slightly refactored solution ###'
array = [5, 3]
bubble_sort_2!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort_2!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort_2!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)