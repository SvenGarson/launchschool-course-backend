=begin
  input:
    nested array of format:
      [
        [fruit_name, count],
        [fruit_name, count]
      ]
  output:
    1D array:
      [fruit_name, fruit_name, fruit_name]
      where each fruit appears as often as string
      as it was specified in the second element of
      each sub-array of the nested array

  requirements:

    explicit:
      - method named: buy_fruit
    
    implicit:
      -? need to handle empty array:
          -> default to empty list when array empty

  ds and algo:

    - create new empty array
    - for each [fruit_name, count] pair:
      - add fruit_name as many times to the empty array
        as specified by count
    - return array of fruit names

=end

def buy_fruit(fruit_count_arr)
  fruit_count_arr.each_with_object([]) do |pair, accum|
    pair.last.times { accum << pair.first }
  end
end

def buy_fruit_2(fruit_count_arr)
  fruit_count_arr.map { |pair| [pair.first] * pair.last}.flatten
end

puts '### Solution with Array#each_with_object ###'
p buy_fruit([['apples', 3], ['orange', 1], ['bananas', 2]]) == 
  ['apples', 'apples', 'apples', 'orange', 'bananas', 'bananas']
p buy_fruit([]) == []

puts '### Solution with Array#map and Array#flatten ###'
p buy_fruit_2([['apples', 3], ['orange', 1], ['bananas', 2]]) == 
  ['apples', 'apples', 'apples', 'orange', 'bananas', 'bananas']
p buy_fruit_2([]) == []