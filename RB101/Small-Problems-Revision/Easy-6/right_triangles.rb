=begin

inp:
- n = length of triangle sides (in characters)
out:
- print right angles triangle with hypoth.
  top left

exp:
- method name: triangle
- side have n stars
- hypthenuse has n stars
- right angle bottom right
- print as star char
imp:
-? what range is argument/n
-? display to the console from inside the method
-? return value of method
-? examples given have odd arguments, argument always
   odd
-? need to handle negative arguments

example output for n = 3

      *
     **
    ***
  
dsal:

  the easy way:
  - for [i] in range [1; n]:
    - print i stars right justified in n long string

  the hard way:
  - for [i] in range [1; n]:
    - spaces = n - i
    - stars = n - spaces
    - str = spaces + stars
    - print

=end

CHAR_FILL = '*'
CHAR_EMPTY = ' '

def triangle(side_len)
  1.upto(side_len) do |row|
    puts (CHAR_FILL * row).rjust(side_len)
  end
end

def triangle_2(side_len)
  1.upto(side_len) do |row|
    spaces = side_len - row
    stars = side_len  - spaces
    str = CHAR_EMPTY * spaces + CHAR_FILL * stars
    puts str
  end
end

3.step(9, 2) do |length|
  triangle(length)
  triangle_2(length)
end