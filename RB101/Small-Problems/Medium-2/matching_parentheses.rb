=begin
  inp:
    string
  outp:
    true or false

  require:

    explic.:
      - method named: balanced?
      - arg         : string, space separated, alpha and non-alpha characters
      - balanced pairs start with '('

    implic.:
      -? string always non-empty
      -! string without parenthesis return true, i.e is valid
         based on test on line 6

  test cases:

    - any sequence of valid open-closing pairs has an even count of parentheses

    inp: '((str))'
    out: true

    - extract parenth:
      -> '((str))' = '(())'
    - remove '()' pairs untils no open-close pair left
      -> (()) - () = ()
      -> () - ()   = ''
      if the string is empty, every open parenth was closed
      
      valid? = '' is empty == true

    inp : '((is)))'
    outp: false

    - extract:
      -> '((is)))' = '(()))'
    - remove '()' pairs until none left
      -> (())) - () = ())
      -> ()) - ()   = )
    valid? = ')' is empty == false


    accum:
      -! odd count of parentheses in string means pairs are not matching
      -! after removing each open-close pair from the string succescively,
         the string ends up empty if each opening-, also had a closing
         parentheses

  ds and algo:
  
    - string to char array
    - extract '(' and ')' characters to a new array in the order occuring in arg
    - extract to string containing the sequence of perenthesis
    - while extract contains a '()' pair:
      - remove the '()' pair
    - if the string is now empty -> return true
    - if the string is not empty -> return false

=end

PARENTH = '()'.freeze

def balanced?(str)
  extract = str.chars.select { |char| PARENTH.include?(char) }.join
  while extract.include?(PARENTH) do
    extract.gsub!(PARENTH, '')
  end
  extract.empty?
end

p balanced?('What (is) this?')      == true
p balanced?('What is) this?')       == false
p balanced?('What (is this?')       == false
p balanced?('((What) (is this))?')  == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!')                 == true
p balanced?(')Hey!(')               == false
p balanced?('What ((is))) up(')     == false