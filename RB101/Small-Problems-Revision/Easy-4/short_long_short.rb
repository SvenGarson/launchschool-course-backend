def short_long_short(a, b)
  short = a
  long = b
  if a.size > b.size
    long = a
    short = b
  elsif b.size > a.size
    long = b
    short = a
  end
  short+long+short
end

def short_long_short_2(a, b)
  if a.size > b.size
    b + a + b
  else
    a + b + a
  end
end

puts '=== Solution A ==='
p short_long_short('abc', 'defgh') == 'abcdefghabc'
p short_long_short('abcde', 'fgh') == 'fghabcdefgh'
p short_long_short('', 'xyz') == 'xyz'

puts '=== Solution B ==='
p short_long_short_2('abc', 'defgh') == 'abcdefghabc'
p short_long_short_2('abcde', 'fgh') == 'fghabcdefgh'
p short_long_short_2('', 'xyz') == 'xyz'