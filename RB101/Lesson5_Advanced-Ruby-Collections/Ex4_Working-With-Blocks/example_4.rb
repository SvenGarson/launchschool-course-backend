=begin

  Line 1:
    - Action            => Assignment: result of Array#each to my_arr
    - Object            => my_arr
    - Side Effect       => my_arr points to the array each is called on
    - Return value      => my_arr -> [[18, 7], [3, 12]]
    - Return value used => no

  Line 1:
    - Action            => Array#each
    - Object            => Array [[18, 7], [3, 12]]
    - Side Effect       => none
    - Return value      => Original Array [[18, 7], [3, 12]]
    - Return value used => assigned to my_arr

  Line 1 - 7:
    - Action            => Block exec.
    - Object            => Each Sub-Array [18, 7] and [3, 12]
    - Side Effect       => none
    - Return value      => Each Sub-Array because each returns array operated on
    - Return value used => no

  Line 2:
    - Action            => Array#each
    - Object            => Each Sub-Array [18, 7] and [3, 12]
    - Side Effect       => none
    - Return value      => Each Sub-Array
    - Return value used => returned by outer block
  
  Line 3:
    - Action            => conditional
    - Object            => each number in Sub-Array
    - Side Effect       => none
    - Return value      => nil
    - Return value used => returned by inner block

  Line 4:
    - Action            => Kernel#puts
    - Object            => Each int in each Sub-Array in case conditional succeeds
    - Side Effect       => prints integer representation of Sub-Array integers if larger than 5
    - Return value      => nil
    - Return value used => returned by conditional if succceeds and by inner loop in that case

=end

my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end

p my_arr