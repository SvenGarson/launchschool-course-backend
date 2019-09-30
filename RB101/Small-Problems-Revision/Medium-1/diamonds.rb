=begin

inp:
- n = size in characters (always odd)
out:
- 4 pointed diamond using '*' character

exp:
- n always odd

imp:
-? n always positive

exploration:

  inp: 3

   *   1 star
  ***  3 stars +2
   *   1 star

  inp: 5

    *   1 star
   ***  3 stars +2
  ***** 5 stars +2
   ***  3 stars -2
    *   1 star  -2

dsal:

  >pseudo
  - generate count sequence ascending and descending
  - for [stars] in seq:
    - row = stars x '*' character centerd in n-long string
    - print row
  - done

  >generate star counts
  - n = hori/verti size in star center
  - ramp = (1...n) odd integers only
  - sequence = ramp + n + ramp.rev

=end

def gen_star_sequence(size, outline_only=false)
  ramp = (1...size).select{ |num| num.odd? }
  complete = ramp + [size] + ramp.reverse
end

def starline(stars, outline_only=false)
  if outline_only and stars > 1
    (' ' * (stars - 2)).center(stars, '*')
  else
    '*' * stars
  end
end

def diamond(size, outline_only=false)
  for stars in gen_star_sequence(size)
    row = starline(stars, outline_only).center(size)
    puts row
  end
end

puts '### Solution for optionally filling and edge drawing ###'
1.step(17, 2) do |size|
  diamond(size)
  diamond(size, true)
end