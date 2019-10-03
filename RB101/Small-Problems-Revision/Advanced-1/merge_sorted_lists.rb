=begin

>Method 'merge'
inp: 2 sorted arrays
out: one new array containing all objects from
		 both arrays in sorted order

exp:
- cannot use any sort of sorting, not even manually
- just add object from both array in correct order
- cannot mutate input arrays

explore:

	inp: [1 5 9] and [2 6 8]
	out: [1, 2, 5, 6, 8, 9]

	smallest in first = 1
	gather everything under or equal to that value from 
	first then from second

	- while left or right not empty:
		- curr =  get lowest from first object in input arrays
		- gather all objects to result that are <= to curr

	1. [] and [1 2]
	lowest = 1 gather all <= 1
	gather = [1]

	2. [] and [2]
	lowest = 2 gather all <= 2
	gather = [1 2]

	3. [] and []
	both empty => done!


	select and remove object from array based on criteria


impl:

	>impl 1
	- merged = empty array
	- while any array not empty:
		# one array must have at least one object
		- ceiling = first.empty? ? second.first : first.first
		- gather and
	- return merged

	>impl 3
	- merged = empty array
	- until both arrays are empty:
		- ceiling as before ...
		- gath1, prim = prim.partition CEIL
		- gath2, sec  =  sec.partition CEI
		- merged.concat(gath1 + gath2)
	- return merged

	>impl 4
	- merged = empty array
	- search index = 0
	- for [curr] object in first array:
		- add to merged all objects from secondary array
			which are <= curr
		- search index = last one added + 1
		- add curr to merged

	- merged = []
	- srch_index = 0
	- for [curr] object in first array:
		- for s in range (src_index...sec.size):
			- other = sec[s]
			- if other <= curr
				-> merge << other
				-> src_index = s + 1
		- merge << curr
	- return merged

=end

def merge_2(a, b)
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


def merge(prim, sec)
	merged = []
	until prim.empty? and sec.empty?
		ceiling = (prim + sec).min
		gath_p, prim = prim.partition{ |obj| obj <= ceiling }
		gath_s, sec  =  sec.partition{ |obj| obj <= ceiling }
		merged.concat(gath_p + gath_s)
	end
	merged
end

puts '### Solution using partitioning of arrays ###'
p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
p merge([1, 5, 9], [2, 6, 12]) == [1, 2, 5, 6, 9, 12]

puts '### Solution using first array objects to gather data from the second ###'
p merge_2([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge_2([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge_2([], [1, 4, 5]) == [1, 4, 5]
p merge_2([1, 4, 5], []) == [1, 4, 5]
p merge_2([1, 5, 9], [2, 6, 12]) == [1, 2, 5, 6, 9, 12]