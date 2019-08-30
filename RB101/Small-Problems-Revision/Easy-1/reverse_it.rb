=begin
  inp:
    1) str = string
  out:
    - return string with words reversed

  req:
    expl:
      - method name: reverse_sentence
      - return empty string if param empty
    imp:
      -? consider separated with 1 space only
  
  ds and algo:
    
  - split string at space into array
  - reverse array in place
  - join with a space, since no firther requirement given and 
    examples use words separated with one space only
  - return that string
 
=end

def reverse_sentence(str)
  str.split(' ').reverse.join(' ')
end

puts reverse_sentence('')            == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'