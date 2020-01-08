=begin

  inp: [2, 5, 1, 4]
  out: [1, 2, 4, 5]
  n  : 4
  range start = (0..n-2) ==> (0..2)

  >bubble sort on an array
  - dirty = true
  - while dirty:
    - dirty = false
    - for i in (0..n-2):
      - left = arr[i]
      - right = arr[i+1]
      - if right < left
        - swap values ...
        - dirty = true
  - return sorted or in place

=end

def bubble_sort!(array)
  dirty = true
  n = array.size
  while dirty
    dirty = false
    for i in (0..(n-2))
      left = array[i]
      right = array[i + 1]
      order = yield(left, right)
      if order > 0
        array[i], array[i + 1] = right, left
        dirty = true
      end
    end
  end
  nil
end

puts "\nOriginal number array"
array_numbers = [8, 2, 7, 9, 4, 1, 3, 5, 6]
p array_numbers

puts "\nAscending ordered number array"
bubble_sort!(array_numbers) { |left, right| left <=> right}
p array_numbers

puts "\nDescending ordered number array"
bubble_sort!(array_numbers) { |left, right| right <=> left}
p array_numbers

puts "\nOriginal String arracy"
array_strings = %w(Hello , I am from Luxemburg)
p array_strings

puts "\nAscending length String array"
bubble_sort!(array_strings) { |left, right| left.length <=> right.length }
p array_strings

puts "\nDescending length String array"
bubble_sort!(array_strings) { |left, right| right.length <=> left.length }
p array_strings
puts ''