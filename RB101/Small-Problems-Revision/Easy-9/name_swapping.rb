=begin
  input:
    string of format 'name last_name'
  output:
    string of format 'last_name, name'

  requirements:
    explicit:
      method named: swap_name
    implicit:
      -? return new of mutated string

  ds and algo:

    - split arg string at space to array
    - first element of array is first name
    - second element is the last name
    - return 'last_name, first_name'

=end

def swap_name(name)
  name.split(' ').reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'

