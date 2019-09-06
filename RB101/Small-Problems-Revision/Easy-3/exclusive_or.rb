=begin
  inp:
    1) bool
    2) bool
  out:
    - if exactly one of the arguments is truthy
      -> true
    - else
      -> false

  req:
    exp:
      - method named: xor?

    imp:
      -? parameters always bool, since 'truthy' is stated

  exploration:
    
    false ^ false = false
    true  ^ true  = false
    true  ^ false = true
    false ^ true  = true

    first false -> second == true
    first true  -> second == false

  ds and algo:

    - result = (first == truthy) ? second == false : second == true
    - result = (first) ? !second : !!second

  This solution has the great advantage that it works with every object
  since we only rely on inverting the truthiness of the objects instead
  of literally comparing them against True and False

=end

def xor?(a, b)
  a ? !b : !!b
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?)   == true
p xor?(5.odd?, 4.even?)  == false
p xor?(5.even?, 4.odd?)  == false