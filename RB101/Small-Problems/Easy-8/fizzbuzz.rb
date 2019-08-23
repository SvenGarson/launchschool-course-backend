=begin
  input:
    arg1: starting number
    arg2: ending number
  output:
    print all numbers 'between' starting and end number but:
      - if divisible by 3       print 'Fizz'
      - if divisible by 5       print 'Buzz'
      - if divisible by 3 and 5 print 'Fizz Buzz'

  requirements:
    explicit:
      - method named: fizzbuzz
      - the test shows that starting and ending number are to be included
        so the range of testing against fizzbuzz is [starting nr.; ending nr.]
      - printing format:
          result, result, result
          -> so no comma space for the last result

    implicit:
      -? need to handle case where end <= start
      -  test shows that if number divisible by 3 and 5
         only print FizzBuzz once exclusively, nothing else

    mental model:

      Go through every number from starting number to ending number
      inclusive in order and print Fizz if number is divisible by 3, Buzz
      if number divisible by 5 and FizzBuzz if divisible by both.
      If number is divisible by both though, print FizzBuzz exclusively

    ds and algo:

      - create new empty string
      - for each number in the list:
        - determine divisibility for 3 and 5 into integer
        - if divisible by 3 add Fizz to string
        - if divisible by 5 add Buzz to string

        - if number:
            - not the last in the list -> add comma space to string
      - print string with newline appended

=end

def fizzbuzz(num_start, num_end)
  str = ''
  (num_start..num_end).each do |num|
    div_by_3 = (num % 3 == 0)
    div_by_5 = (num % 5 == 0)
    div_by_both = div_by_3 && div_by_5
    if div_by_both
      str << 'FizzBuzz'
    elsif div_by_3
      str << 'Fizz'
    elsif div_by_5
      str << 'Buzz'
    else
      str << num.to_s
    end

    str << ', ' if num != num_end
  end
  puts str
end

fizzbuzz(1, 15)
