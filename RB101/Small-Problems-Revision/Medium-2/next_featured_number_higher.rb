=begin
  inp:
    integer (based on tests given)
  out:
    featured number or erro string

  requir.:
  
    explic.:
      - method named: featured()
      - arg         : integer
      - return      : featured number or error string
      - featured number is:
        - odd
        - multiple of 7
        - digit occur only once, no digit twice      
      - return error message is there is no next featured number
          -> 'There is no possible number that fulfills those requirements'

    implic.:
      -? what is the largest possible featured number, in the context
         of this problem
      -! since the last test given states that there are no more
         featured numbers after 9_999_999_999, the next lower number
         divisible by seven is used which is 9_999_999_998

  mental model: return the next, larger featured number than the one given
  as parameter and return that number, if no more featured numbers exist,
  return the error string

  ds and algo:

  - loop forever:
    - get next mo7 (also odd to make the search faster)
    - exit loop if > max featured
    - return number if featured
  - code got here, no number returned -> return error msg

    getting the next mo7:
    
    - nextmo7 = arg+1
    - incr nextmo7 until it's a mo7
    - return mo7

      -> make the proess faster by looking for the next mo7
         that is also odd

    compute if number has unique digits:

    - number to string
    - number to chars array
    - remove doubles
    - if array unchanged -> unqiue
    - if array   changed -> not unique

=end

MSG_ERR = 'There is no possible number that fulfills those requirements'.freeze
MAX_FEATURED = 9_999_999_998

def next_odd_multiple_of_7(base)
  nxt = base + 1
  nxt += 1 until (nxt % 7 == 0) && (nxt.odd?)
  nxt
end

def digits_unique?(number)
  number.to_s.chars.uniq! == nil
end

def featured(number)
  loop do
    number = next_odd_multiple_of_7(number)
    break if number > MAX_FEATURED
    return number if digits_unique?(number)
  end
  return MSG_ERR
end

p featured(12)            == 21
p featured(20)            == 21
p featured(21)            == 35
p featured(997)           == 1029
p featured(1029)          == 1043
p featured(999_999)       == 1_023_547
p featured(999_999_987)   == 1_023_456_987
p featured(9_999_999_999) == MSG_ERR