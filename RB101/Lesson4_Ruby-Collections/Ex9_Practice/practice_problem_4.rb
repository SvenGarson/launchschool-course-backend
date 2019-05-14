=begin
  each_with_object returns the original object that it is handed
  as a parameter, in this case a hashmap.
  The method iterates over the array it is called on, and has no
  side effects itself.
  In this case, the hash has a key value pair added to it for every
  string in the iterated array. Each key value pair consists of:
    - Key:    first character of the currently iterated string
    - Value:  the whole string itself

  So the return value is the original array that was passed to the
  each_with_object method containing/added to it:
  {
    'a' => 'ant',
    'b' => 'bear',
    'c' => 'cat'
  }
=end

result = ['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
           hash[value[0]] = value
         end

puts "result: #{result}"

