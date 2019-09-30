=begin

inp:
- string of format: 'first last'
out:
- string of format: 'last, first'

dsl:

  >pseudo
  - split to array [first, last] at space
  - return reversed array joined by ', '
    -> [last, first] ==> 'last, first'

=end

def swap_name(name_str)
  name_str.split(' ').reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'