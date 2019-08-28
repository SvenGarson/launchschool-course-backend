def crunch(str)
  no_doubles = []
  str.chars.each do |ch|
    no_double << ch unless no_doubles.include?(ch)
  end
  co_doubles
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('') == ''