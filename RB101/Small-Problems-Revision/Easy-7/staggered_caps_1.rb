=begin

inp:
- strin
out:
- new string which every other char capitalized/upcased
  and rest lowercased

exp:
- starting with uppercase
- swapping case each character

imp:
-? string ever empty

  - res = empty string
  - uppercase = true
  - for each character in string:
    - if char is alpha:
      - if uppercase -> res << char upper
      - else         -> res << char lower
    -
      else
        -> res << char
  - return res

=end

def staggered_case(str)
  res = ''
  upper = true
  str.chars.each do |char|
    res << if upper
              char.upcase
            else
              char.downcase
            end
    upper = !upper
  end
  res
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
p staggered_case('') == ''
p staggered_case(' ') == ' '