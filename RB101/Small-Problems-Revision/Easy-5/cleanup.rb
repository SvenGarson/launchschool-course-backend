=begin
  
  inp:
    - string with alpha and non-alpha characters
  out:
    - string with all non-alpha replaced by ONE space

  exp:
    - method name: cleanup
    - result has no consecutive spaces
  imp:
    -? does '... returns that string with ...' mean
       to mutate the original string and return that
       one or new string
    -? input string lowercase only or consider upper
       and lowercase

  ds and algo:

    - str = new empty string
    - last = any alpha character
    - for every character cĥ in the string:
      - if ch is alpha:
        -> add to string
      - else
        -> if last char is alpha
          -> add space
      - last is ch
    - return str

=end

ALPHAS = ('a'..'z').to_a + ('A'..'Z').to_a

def cleanup(str)
  result = ''
  str.chars.each do |char|
    if ALPHAS.include?(char)
      result << char
    else
      result << ' ' unless result[-1] == ' '
    end
  end
  result
end

def cleanup_regex(str)
  str.gsub(/[^a-zA-Z]/, ' ').squeeze(' ')
end

puts '### Solution using iteration ###'
p cleanup("---what's my +*& line?") == ' what s my line '

puts '### Solution using regex ###'
p cleanup_regex("---what's my +*& line?") == ' what s my line '