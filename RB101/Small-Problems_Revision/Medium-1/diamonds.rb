=begin
  input:
    odd integer
  output:
    4 pointed diamond drawn as star characters

  requir.:

    explic.:
      - method name: diamond
      - arg integer always odd
      - grid width X height is n X n => arg integer
        both for width and height

    implic.:
      -? arg integer always > 0

  mental model:

    Generate a list of the stars and soaces per row for a given
    size of star which is always odd, then draw that information
    line per line
  

  test cases:

    inp: 1
    out:

      *

    inp: 3
    out:

       *
      ***     1 + 2
       *

    inp: 5
    out:

        *     1 
       ***    1+2 = 3
      *****   3+2 = 5
       *** 
        * 

  ds and algo:

    1) generate list of:
      - count of leading   spaces
      - count of following stars
    2) iterate that list and print spaces then stars per line

=end

def gen_star_count(size)
  range_up  = (1..size).select { |v| v.odd? }
  range_up + range_up[0..-2].reverse
end

def diamond(size, fill)
  gen_star_count(size).each do |stars|
    star_str = ('*' * stars)
    
    if !fill
      star_str[1..-2] = ' ' * (stars - 2) if stars > 2
    end

    puts star_str.center(size)
  end
end

1.step(9, 2) do |size|
  puts "### Diamond size #{size} without fill ###"
  diamond(size, false)
  puts "### Diamond size #{size} with fill ###"
  diamond(size, true)
end