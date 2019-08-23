=begin
  inp:
    string
  outp:
    hash that contains [k, v] pairs:
      - [lowercase: percentage_lowercase_chars]
      - [uppercase: percentage_uppercase_chars]
      - [neither  : percentage_neither_chars]

  requir.:

    explic.:
      - method named: letter_percentage
      - arg         : string
      - arg contains at least one character
      - hash keys are symbols

    implic.:
      -! percentages add up to 100.0
      -! test on line 2 shows floating point percentage
         so it's best to make every percentage value
         float explicitely
      -! the hash the result is checked against, contains
         floats and integers as keys which means that in
         order to pass the tests given, a whole numbers needs
         to be an integer, where a number with a fraction needs
         to be a float.

  math:

    arg = 'ABde!'
    uppercase = AB ==> 2
    lowercase = de ==> 2
    neither   =  ! ==> 1

    total chars = 5

    <=> 1 / 5    | x 20
    <=> 20 / 100
    ==> 20 / 100 ==> 20 percent

    lowercase perc = 2 / 5 * 100 = 40
    uppercase perc = 2 / 5 * 100 = 40
    neither   perc = 1 / 5 * 100 = 20
    total = 40 + 40 + 20 = 100

  ds and algo:

    - set count for lower, upper and neither to 0
    - for every [CHAR] in arg [STR]:
      - if [CHAR] is a character:
        - if [CHAR] == [CHAR].upcase
            -> uppercase count += 1
        - if [CHAR] == [CHAR].downcase
            -> lowercase count += 1
      - else
        -> neither count += 1

    - total count = lower_ct + upper_ct + neither_ct
    - lower_perc = lower_ct / total_ct * 100
    - same for upper and neither counts

    cleaner version:

      - init hash with init object Integer zero
      - for every char in the string:
        - if char is a character:
          - if char is uppercase:
              -> incr uppercase in hash
          - if char is lowercase:
              -> incr lowercase in hash
        - else
          -> incr neither in hash
      - compute total count from hash
      - map hash [K,V] => [case/neither, count] to:
        - [K, count.to_f / total_count.to_f * 100.0] !!! FLOAT !!!
      - return the hash
        
=end

ALPHA_LOWER = ('a'..'z').to_a.join.freeze
ALPHA_UPPER = ('A'..'Z').to_a.join.freeze

def letter_percentage(str)
  count_hsh = { lowercase: 0, uppercase: 0, neither: 0 }
  str.chars.each do |char|
    if ALPHA_LOWER.include?(char)
      count_hsh[:lowercase] += 1
    elsif ALPHA_UPPER.include?(char)
      count_hsh[:uppercase] += 1
    else
      count_hsh[:neither] += 1
    end
  end
  count_total = count_hsh.values.reduce(:+).to_f
  count_hsh.each do |key, count| 
    perc = count.to_f / count_total * 100.0
    # convert perc to integer explicitly if the number has
    # no fraction, but ruby sees the expression 25.0 == 25
    # as true, so the coversion is not needed in this case
    # perc = perc.to_i if (perc % 1.0) == 0
    count_hsh[key] = perc.round(2)
  end
end

p letter_percentage('abCdef 123') == { lowercase: 50,    uppercase: 10,    neither: 40 }
p letter_percentage('AbCd +Ef')   == { lowercase: 37.5,  uppercase: 37.5,  neither: 25 }
p letter_percentage('123')        == { lowercase: 0,     uppercase: 0,     neither: 100}
p letter_percentage('abcdefGHI')  == { lowercase: 66.67, uppercase: 33.33, neither: 0.0}