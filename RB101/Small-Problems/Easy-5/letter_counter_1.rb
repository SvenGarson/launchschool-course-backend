def word_sizes(str)
  count_hsh = {}
  str.split(' ').each do |sub|
    length = sub.size
    if count_hsh.has_key? length
      count_hsh[length] += 1
    else
      count_hsh[length] = 1
    end
  end
  count_hsh
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2=> 1, 4 => 1}
p word_sizes('') == {}