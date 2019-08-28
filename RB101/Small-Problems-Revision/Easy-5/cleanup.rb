ALPHA_CHARS = ('A'..'Z').to_a + ('a'..'z').to_a

def is_alpha?(ch)
  ALPHA_CHARS.include?(ch)
end

def cleanup(str)
  clean_str = ''
  last_char = 'a'
  str.chars.each do |curr_char|
    last_valid = is_alpha?(last_char)
    curr_valid = is_alpha?(curr_char)
    if !last_valid && curr_valid
      clean_str << ' '
      clean_str << curr_char
    elsif last_valid && curr_valid
      clean_str << curr_char
    end
    last_char = curr_char
  end
  clean_str
end

p cleanup("---what's my +*& line?") == ' what s my line'

=begin
  input:
    string with alpha and nnon-alpha characters

  output
    replace all non-alpha chars with one space
    if multiple non-alpha chars in a row, one space only
  
  questions:
    return the same or a new string?

=end