=begin

>Method
inp:
- array with at least 2 elements
side_effect:
- array sorted in place using bubble-sort
	in ascending order
out:
- ?

exp:
- use bubble sort
- mutate array in place
- at least 2 elements in array
- order: ascending
- for now just return the argument array

imp:
-? return argument in array

explore:

	for an array of size 5 indices to check:

		[0, 1] where [i+0, i+1]
		[1, 2]
		[2, 3]
		[3, 4] where [i+0, i+1] => [3+0, 3+1]

	which means we can use and index from 0 upto and including size-1
	as base index

impl:

	- as long as a swap happened:
		- for successive index pairs in array ia and ib:
			- if object ib > object ia:
				-> swap in plance
				-> set swap happened true
	- return arg array

	>impl 1
	- swapped = true
	- while swapped
		- swapped = false
		- for [i] in range (0...size-2):
			- if arr[i+1] < arr[i+0]
				-> swap here +  set flag true
		
	- return array

=end

def bubble_sort!(arr)
	loop do
	swapped = false
		0.upto(arr.size-2) do |i|
			if arr[i] > arr[i+1]
				arr[i], arr[i+1] = arr[i+1], arr[i]
				swapped = true
			end
		end

		break unless swapped == true
	end
	arr
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)