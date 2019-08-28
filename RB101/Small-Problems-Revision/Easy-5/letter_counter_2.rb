ALPHA = ('A'..'Z').to_a + ('a'..'z').to_a

def word_sizes(str)
  count_hsh = Hash.new(0)
  str.split(' ').each do |sub|
    alpha_str = sub.chars.map { |ch| ALPHA.include?(ch) ? ch : '' }.join('')
    count_hsh[alpha_str.size] += 1
  end
  count_hsh
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2}
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1}
p word_sizes('') == {}