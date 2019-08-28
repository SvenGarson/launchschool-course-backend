=begin
  input:
    number without leading zero's
  output:
    number with digits reversed
  
  requirements:
    explicit:
      method  named: reversed_number
      argument: one number -> int based on the given examples
      no leading zero's in the returned number

    implicit:
      -? number always integers

  mental model:

    Return the number with it's digits reversed and remove any
    leading zero's in the reversed number

  test cases:

    inp: 12345
    out: 54321

    1) str = inp.to_s    = '12345'
    2) rev = str.reverse = '54321'
    3) num = rev.to_i    =  54321

    inp: 12000
    out: 21

    1) str = inp.to_s    = '12000'
    2) rev = str.reverse = '00021'
    3) num = rev.to_i    =  21

  ds and algo:

    - convert number to string
    - reverse the string
    - cast number to integer
    - return the number

=end

def reversed_number(number)
  number.to_s.reverse.to_i
end 

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456)   == 654
p reversed_number(12000) == 21
p reversed_number(12003) == 30021
p reversed_number(1)     == 1