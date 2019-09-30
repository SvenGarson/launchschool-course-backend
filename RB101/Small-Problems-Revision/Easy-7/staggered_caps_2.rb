=begin

Same as previous exercise but do not toggle the
boolean when current character is non-alpha

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
    # toggle only on alpha characters
    upper = !upper if char =~ /[a-z]/i
  end
  res
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
p staggered_case('') == ''
p staggered_case(' ') == ' '