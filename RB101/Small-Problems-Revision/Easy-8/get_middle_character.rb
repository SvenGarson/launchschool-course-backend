=begin

inp:
- string of length [1; inf[

out:
- middle character of arg string

exp:
- string len even -> return 2 center chars as string
- string len odd  -> return 1 center char  as string
- return strings can included whitespace

exploration:

  inp: Hey
  out: e
    
    inp odd -> return 1 char str
    n = 3
    center = h / 2 => 1
    return substring inp index 1

    range => (1..1) ==> (center..center)

  inp: Mill
  out: il

    inp even -> return 2 char str
    n = 4
    center = h / 2 = 2
    return substring inp (1..2)

    range => (1..2) ==> (h-1..h)

dsal:

  >pseudo:
  - get range based on odditiy
  - return ranged substring

  >pseudo 2
  - center = (str.length / 2).floor
  - if str odd:
    -> range = (center..center)
  - if str even:
    -> range = (center-1..center)
  - return range substring

=end

def center_of(str)
  center = (str.length / 2).floor
  if str.length.odd?
    str[center]
  else
    str[center-1..center]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'