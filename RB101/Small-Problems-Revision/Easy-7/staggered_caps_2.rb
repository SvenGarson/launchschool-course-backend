=begin
  ds and alo:
    
    - now the non-alphabetic characters dont count for swapping the case
    - the new string stiill starts with an upcase character

    - set set_upper to true
    - create empty string
    - for every character in the original string:
      - if set_upper == true  -> add uppercase version to new string
      - else                  -> add downcase  version to new string
      - if character is alphabetical -> invert set_upper
    return the new string


=end

ALPHA = ('a'..'z').to_a + ('A'..'Z').to_a

def staggered_case(string)
  set_upper = true
  staggered_str = ''
  string.chars.each do |char|
    if set_upper
      staggered_str << char.upcase
    else
      staggered_str << char.downcase
    end
    set_upper = !set_upper if ALPHA.include?(char)
  end
  staggered_str
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL_CAPS') == 'AlL_cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'