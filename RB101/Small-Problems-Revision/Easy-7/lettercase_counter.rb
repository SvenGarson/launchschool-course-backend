=begin

inp:
- some string
out:
- hash with upper/lower/neither counts

exp:
- method name: letter_case_count
- return hash entries:
  - lowercase sym => count
  - uppercase sym => count
  - neither   sym => count
- if string empty return hash with counts set to zero

dsal:
  - hsh = hash with symbols for upper/lower/neither to count zero
  - for each character in the string:
    - if char alpha:
      - if upper -> incr upper
      - else -> incr lower
    - else (not alpha)
      - incr other
  - return hash

  cleaner:
    - res = new hash
    - res[:uppercase] = count for all chars which are upper chars
    - same lowe rand neither
    - return it

=end

ALPHA_UPPER = ('A'..'Z').to_a.join.freeze
ALPHA_LOWER = ('a'..'z').to_a.join.freeze

def letter_case_count(str)
  count = Hash.new
  chars = str.chars
  count[:uppercase] = chars.count { |char| ALPHA_UPPER.include? char}
  count[:lowercase] = chars.count { |char| ALPHA_LOWER.include? char}
  count[:neither] = chars.length - (count[:uppercase] + count[:lowercase])
  count
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }