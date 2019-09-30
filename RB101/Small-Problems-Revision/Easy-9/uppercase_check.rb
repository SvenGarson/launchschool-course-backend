=begin

inp:
- string
out:
- true if all alpha characters are uppercase,
  fase if not

exp:
- consider only alpah character for uppercase check
- ignore non-alpha characters
- empty strings return true by default

imp:
-? can i write helper method
-? true for completely empty string or
   only if no alphabetical character in the string

dsal:

  >pseudo
  - if string empty -> return true
  - extract all alpha characters form arg string
  - check if all are uppercase
  - return result

=end

def uppercase?(str)
  # guard against empty string
  return true if str.empty?

  alphas = str.gsub(/[^a-z]/i, '')
  alphas.chars.all? { |char| char == char.upcase }
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true