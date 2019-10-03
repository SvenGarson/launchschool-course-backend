=begin

>Method 'merge_sort'
inp:
- one array of Integers or String
- always just one type though
out:
- sorted array using merge sort

imp:
-? can we use merge method from previous exercise

exp:
- merge_sort is recursive

exploration:

	- exit condition of megre sort:
		-> when passed in array size 1, return it
	- break up input array into halves:
		-> if input odd and > 1, extra object goes
			 in left list
	- upward merge sorted lists

impl:

	left = arr[0, h]
right = arr[h, n-h]


	>merge_sort
	- return list if list.size <= 1
	- n = list.size
	- half = n.fdiv(2.0).ceil
	- merge_sort(self(list[0, half]), self(list[half, n - half])

=end

def merge(a, b)
	#guard againt first array being empty
	return b.dup if a.empty?
	merged = []
	srch_index = 0
	for curr in a
		for s in (srch_index...b.size)
			other = b[s]
			if other <= curr
				merged << other
				srch_index = s + 1
			end
		end
		merged << curr
	end
	merged.concat(b[srch_index..-1])
end

def merge_sort(arr)
	n = arr.size
	return arr if n == 1
	half = n.fdiv(2.0).ceil
	first_half = arr[0, half]
	second_half = arr[half, n - half]
	merge(merge_sort(first_half), merge_sort(second_half))
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]