=begin
  in:
    array of ints
  out:
    array of ints

  requir.:

    explic.:
      tests given:
        1) []        -> []
        2) [3]       -> [21]
        3) [3, 4]    -> [9, 16]
        4) [5, 6, 7] -> [25, 36, 49]

      - if array empty    -> return empty array
      - if array size = 1 -> return single object multiplied by 7
      - if array size > 1 -> reutnr all values in array squared

      implic.:
        -? fix the bug in the code given or change the code to
           make it clearer, safer, cleaner

    explanation:
      
      after testing in irb i found that an elsif without conditional
      sometimes runs the code inside it, and the if/elsif/else block 
      results in tha last expression in that elsif sometimes executes
      and returns nil immediately for the whole if/elsif/else and
      sometimes falls through, to the next conditional after executing
      the code inside the elsif.

      The behaviour seems to depend on what is on the line after the elsif,
      I did not know that ruby looks at the nest line if the conditional is
      missing, but it makes sense now.

      In this case it seems to stop at the elsif without running any code
      and just returns nil for the whole if/elsif/else.

      To fix this, a conditional that runs the elsif for array that are 
      of size larger than one gives the desired output.

      After reading the solution:

      So if the ruby parser finds an if/elsif withoug condition, it takes
      the expression in the next line and makes that the conditional. But
      this bascially 'consumes' that expression as conditional, and if that
      is truthy will well run the if/elsif block, but if the one line after
      is the only line, no code will be 'left' to run, and that means a default
      return value of nil

=end

def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])