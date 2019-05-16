# using the each method output all the vowels of the strings in hsh
# vowels: AEIOU

hsh = {first: ['the', 'quick'],
       second: ['brown', 'fox'],
       third: ['jumped'],
       fourth: ['over', 'the', 'lazy', 'dog']
}

hsh.each do |_, value|
  value.join.chars.each do |ch|
    puts ch if %w(a e i o u).include?(ch)
  end
end