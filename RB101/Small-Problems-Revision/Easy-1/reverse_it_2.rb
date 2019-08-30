=begin
  inp:
    1) str = string one or more words
  out:
    - string that has words with >= 5 characters reversed
    
  req:
    expl:
      - string only letters and spaces
      - includes space when more than one word present
    impl:
      -? does 'return the given string' mean to mutate the original
         string or the original string with partwise new contents as
         new string
      -! return a new string for now

  ds and algo:

  - split = string at space
  - for each curr string in split
    - if curr.length >= 5 reverse curr in place
  - join splits
  - return the string

=end

def reverse_words(str)
  str.split(' ').each do |word|
    word.reverse! if word.length >= 5  
  end.join(' ')
end

puts reverse_words('Professionnal')         == 'lannoisseforP'
puts reverse_words('Walk around the block') == 'Walk dnuora the kcolb'
puts reverse_words('Launch School')         == 'hcnuaL loohcS'