=begin

  input : string conatining on or more words, letters and spaces
  output: string with all words that are >= 5 long reversed

=end

def reverse_words(string)
  words = string.split
  words.each { |word| word.reverse! if word.size >= 5}
  words.join(' ')
end


puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')
