=begin

  in:
    arg size of nxn grid when arg = n
  out:
    star as explained below
    
  requir.:
    explic.:
      - method named: star()
      - arg:        : odd Integer size of grid
      - return      : output to STDOUT i.e nil
      - output an 8 pointed star
      - grid size, width = height

    implic.:
      -? return value of method      

  test cases:
    
    7x7 star:
      
      *  *  *  - 7 wide - 3 stars - 0 leading - 2 spacing 
       * * *   - 7 wide - 3 stars - 1 leading - 1 spacing
        ***    - 7 wide - 3 stars - 2 leading - 0 spacing
      *******
        ***  
       * * * 
      *  *  *

      - spacing between stars formula:
        -> (wide - stars - (leading * 2)) / 2

      *  *  *  (7 - 3 - (0 * 2)) / 2 = (4 - 0) / 2 = 4 / 2 = [2]
       * * *   (7 - 3 - (1 * 2)) / 2 = (4 - 2) / 2 = 2 / 2 = [1]
        ***    (7 - 3 - (2 * 2)) / 2 = (4 - 4) / 2 = 0 / 2 = [0]
      *******  (7 - 7 - (0 * 2)) / 2 = (0 - 0) / 2 = 0 / 2 = [0]
        ***  
       * * * 
      *  *  *

      the result of the formulae denotes the spaces between the
      three stars in the center, for seven there is none.

      So to print a row, in general, the data needed is:
        -> f(width, stars, leading_space)
      And the printing format based on the resulting space:
        -> gap = f(width, stars, leading)
        -> ' ' * leading space
        -> for every star:
          -> '*'
          -> if not last star ' ' * gap

  ds and algo:

    - method that prints line/ of a star given(width, stars, leading_space):
      - gap = (width - stars - (leading * 2)) / 2
      - print leading spaces
      - print star/gap/star/gap ... but not gap for last star

    - start method:
      - compute how many star lines until the center:
        -> slope_steps = (n-1) / 2
      - print line for leading spaces range (0...slope_steps)
      - print line all stars
      - print line for leading spaces range (slope_steps-1..0)


  further exploration:

    draw a sine wave for arguments:
      -> width, height, step_per_column, starting value, ?

=end

def star_line(width, stars, leading_spaces)
  gap = (width - stars - (leading_spaces * 2) ) / 2
  print ' ' * leading_spaces
  1.upto(stars) do |i|
    print '*'
    print ' ' * gap unless i == stars
  end
  print "\n"
end

def star(grid_size)
  slope_steps = (grid_size - 1) / 2
  0.upto(slope_steps-1) { |i| star_line(grid_size, 3, i) }
  star_line(grid_size, grid_size, 0)
  (slope_steps-1).downto(0){ |i| star_line(grid_size, 3, i) }
end

3.step(17, 2) do |n|
  print "### 8-pointed star, grid size #{n} ###\n\n"
  star(n)
  print "\n"
end