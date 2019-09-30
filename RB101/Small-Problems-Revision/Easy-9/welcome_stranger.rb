=begin

inp:
1. array with 2 or more strings
2. hash [symbol, string] with 2 entries

out:
- String of format: 'Hello, name1 name2 nameX!
                     Nice to have a TITLE OCCUPATION around.'

exp:
- generate name by joining names array with spaces
- hash contains string for:
  -> :title
  -> :occupation

dsal:

  >pseudo
  - name = join array elements with space
  - build sentence containing the generated data
  - return it

=end

def greetings(names, attribs)
  full_name = names.join(' ')
  title = attribs[:title]
  occup = attribs[:occupation]
  msg = "Hello, #{full_name}! Nice to have a #{title} #{occup} around."
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }) == "Hello, \
John Q Doe! Nice to have a Master Plumber around."