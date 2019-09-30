=begin

inp:
- a string
out:
- new string with every char doubled

exp:
- return new string
- inp empty -> return empty
- every occuring char is doubled, also blank
imp:

dsal:

  >pseudo
  - res = new empty string
  - for each char in arg:
    - res << char 2x
  - return res

  >pseudo faster
  - chars = split string into characters
  - res = new char array 2x arg length 
  - for [i] and [o] in range [0; arg.length[ :
    - target_base = i * 2
    - res[target_base + 0] = o
    - res[target_base + 1] = o
  - return res

=end

def repeater(str)
  str.chars.each_with_object('') do |char, res|
    res << (char * 2)
  end
end

def repeater_2(str)
  chars = str.chars
  res_ar = Array.new(chars.length * 2)
  chars.each_with_index do |char, i|
    target_base = i * 2
    res_ar[target_base + 0] = char
    res_ar[target_base + 1] = char
  end
  res_ar.join
end

puts '### Solution using adding to an empty string ###'
p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

puts '### Solution using correctly sized array from the start ###'
p repeater_2('Hello') == "HHeelllloo"
p repeater_2("Good job!") == "GGoooodd  jjoobb!!"
p repeater_2('') == ''