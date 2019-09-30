=begin

inp:
- some array
out:
- nested array that contains arg split in middle

exploration:

  inp: [1, 2, 3, 4]
  out: [[1, 2], [3, 4]]

  n = arg.length
  n = 4
  half = n / 2
  half = 2

    if n even:
      -> sub 1 range = [0; half[ -> 0, 1
      -> sub 2 range = [half, n[ -> 2, 3
    
    ==> [[1, 2], [3, 4]]

  inp: [1, 2, 3]
  out: [[1, 2], [3]]
  n = 3
  half = (int)(3/2)
  half = 1

    if n odd:
      -> sub 1 range = [0; half]   -> 0, 1
      -> sub 2 range = [half+1; n[ -> 2
    
    ==> [[1, 2], [3]]

exp:
- return new nested array that contains both 'halves'
- if arg array length odd:
  -> place center element ni first sub-array
- empty arg array returns array with 2 empty sub-arrays


---------------
if n even:
      -> sub 1 range = [0; half[ -> 0, 1
      -> sub 2 range = [half, n[ -> 2, 3

if n odd:
      -> sub 1 range = [0; half]   -> 0, 1
      -> sub 2 range = [half+1; n[ -> 2

-------------------------
    
dsal:

  - res = new array
  - determine range for sub_1 and sub_2
  - add sub_1 from arg -> res
  - add sub_2 from arg -> res
  - return res

  - res = new empty array
  - n = arg.length
  - half = (n / 2).floor
      - if n even:
        - rng_1 = (0...half)
        - rng_2 = (half...n)
      - if n odd:
        - rng_1 = (0..half)
        - rng_2 = (half+1...n)
  - res << rng 1 and rng 2
  - return res

=end

def halvsies(arr)
  res = []
  half = (arr.length/2.0).ceil
  res << arr[0, half] << arr[half, arr.size - half]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]