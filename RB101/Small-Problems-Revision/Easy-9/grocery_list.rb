=begin

inp:
- nested array of array:
  -> each nested is:
    1. fruit name
    2. desired count
out:
- string array of fruit names based on count

exp:
- each arg sub-array is has elements:
  1. fruit name as string
  2. desired count as Int

dsal:

  >pseudo
  - res = empty array
  - for each sub-array in arg:
    - count times:
      - add fruit name to res
  - return res    

=end

def buy_fruit(shopping_list)
  shopping_list.map { |item| [item.first] * item.last }.flatten
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]