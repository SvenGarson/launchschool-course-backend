=begin
  inp:
    positive integer n which denotes how many stars a side
      of the triangle has
  output:
    ascii representation of a triangles with the hypotenuse on the left
      and the right angle at the bottom right

  requirements:
    explicit:
      method called triangle
      parameters 1 positive number
      use star characters for the triangles inside and space for the rest
      hypotenuse left
      right angle at the bottom right

    implicit:
      

  mental model:

    take the length of the sides for a right angled triangle as positive
    integer and draw a triangle represented wth star characters, and the
    rest spaces with the right angle corner at the bottom right into the
    terminal

  ds and algo:

    the confinment/box the triangle is in is always the same height and
    width as the argument passed to the method

    length of side = len
    for row in len (0...len):
      stars_for_row = row + 1
      spaces_for_row = len - stars_for_row
      print spaces
      print stars

  inp: = 5
  out: 

  +-----+
  |    *|   stars = 0+1 = 1 | spaces = len - stars = 5 - 1 = 4
  |   **|
  |  ***|
  | ****|
  |*****|   stars = 4+1 = 5 | spaces = len - stars = 5 - 5 = 0
  +-----+


=end

def triangle(number)
  for row in (0...number) do
    ct_stars = row + 1
    ct_spaces = number - ct_stars
    puts ' ' * ct_spaces + '*' * ct_stars
  end
end

triangle(9)