=begin

  inp:
    - string with space separated words
  out:
    - hash with [K, V] = [word_length, count of words with that length]

  exp:
    - method name: word_sizes
    - word = any string that does not include space
    - empty string returns empty hash
    
  ds and algo:

    # draft #
    - new hash with default object Integer 0
    - split string into words at space
    - for every word in splits:
      - count characters
      - increment count in hash of count as key
    - return hash

=end

def word_sizes(str)
  count_hsh = Hash.new(0)
  str.split.each do |word|
    count_hsh[word.length] += 1
  end
  count_hsh
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 =>1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}