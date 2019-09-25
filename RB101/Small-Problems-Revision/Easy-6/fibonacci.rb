=begin

  inp:
  - number of digits of the fibonacci number we want
    the index of
  out:
  - index of the first fib number that has arg digits

  exp:
  - first two fib numbers are 1
  - argument always in range [2; +inf]
  - index of fib number returned starts at 1

  imp:
  -? to make sure we don't get an infinite loop,
     return the index of the first number that has
     arg digits or larger

  ds and algo:
  
    - index = 1
    - while generating a fib number [curr]:
      - if [curr] has digits >= arg
        -> break
      - else
        - index++
    - return index
    
  - index = 1
  - last = [1, 1]
  - loop:
    - fib_next = last.sum
    - if fib_next has digits >= arg
      -> break
    - last.first = last.last
    - last.last = fib_next
    - index += 1
  - return index
    
  1, 1, 2, 3, 5, 8

=end

def number_of_digits(number)
  number.to_s.length
end

def find_fibonacci_index_by_length(digits)
  last = [1, 1]
  index = last.length+1
  loop do
    fib_next = last.reduce(:+)
    break if number_of_digits(fib_next) >= digits
    
    last[0], last[1] = last.last, fib_next
    index += 1
  end
  index
end

p find_fibonacci_index_by_length(2)     == 7
p find_fibonacci_index_by_length(3)     == 12
p find_fibonacci_index_by_length(10)    == 45
p find_fibonacci_index_by_length(100)   == 476
p find_fibonacci_index_by_length(1000)  == 4782
p find_fibonacci_index_by_length(10000) == 47847