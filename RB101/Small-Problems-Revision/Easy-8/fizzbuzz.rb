=begin

inp:
- floor
- ceiling
out:
- list of Fizz/Buzz/FizzBuzz/Number in right order

exp:
- divisible by 3 only  -> 'Fizz'
- divisible by 5 only  -> 'Buzz'
- divisible by 3 and 5 -> 'FizzBuzz'
- not divisible by and -> number
- string/output format: 'a, b, c, d'
- floor and ceiling inclusive
imp:
-? output in the method
-? output in the loop or gather results in array
   to print everything at once
-? input validation
-? how to handle negative/zero numbers or input always >= 0
-? need to handle floor > ceiling

dsal:

  - res = new empty array
  - iterate range of numbers [floor; ceiling] as [i]
    - db3 = i % 3 == 0
    - db5 = i % 5 == 0
    - if db3 and db5 ->  add 'FizzBuzz'
    - elsif db3       -> add 'Fizz'
    - elsif db5       -> add 'Buzz'
    - else            -> add i
  - print result array

=end

FIZZ = 'Fizz'.freeze
BUZZ = 'Buzz'.freeze
FIZZBUZZ = (FIZZ + BUZZ).freeze

def fizzbuzz(floor, ceiling)
  results = []
  (floor..ceiling).each do |num|
    db3 = (num % 3 == 0)
    db5 = (num % 5 == 0)
    num_result = if db3 and db5
                   FIZZBUZZ
                 elsif db3
                   FIZZ
                 elsif db5
                   BUZZ
                 else
                   num
                 end
    results << num_result
  end
  p results
end

fizzbuzz(1, 15)

# -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, Fiz
