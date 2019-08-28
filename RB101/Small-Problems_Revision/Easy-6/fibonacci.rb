=begin

  input:
    number of digits in desired fibonacci-sequence number

  output:
    index of the first fib. number that has the desired amount of digits

  requirements:
    explicit:
      first 2 numbers in fib. sequence are 1 by definition
      indexing starts at 1 for the first fib. number
      argument is in range [2; inf]

    implicit:
      ? does the fibonacci series have a number in the sequence for every number of digits?
      ? since the set of numbers generate is not known to me to a good enough level, I think
        the method should check for numbers that have the exact amount of digits and larger
        to make sure the loop exits at some point

    mental model:
      Get the index of the first number in the fibonacci sequence that has
      as many digits as the argument dictates and return that index.

  test cases:

    fib = 1,1,2,3,5,8,13,..

  inp: 2
  out: 7

  data structure and algorithm:
  
  set array that contains last numbers starting with last = [1, 1]
  set index to 3 since we start with the third number 
  loop forever:
    next fib = last.first + last.last
    digits = fib.to_s.size
      if digits match desired value -> return index
    set last.first to last.last
    set last.last to fib
    increment index

  accum:
    n/a

=end

def find_fibonacci_index_by_length(digits)
  last = [1, 1]
  index = 3
  loop do
    fib_next = last.first + last.last
    fib_digits = fib_next.to_s.size
    break if fib_digits == digits
    last[0]  = last.last
    last[-1] = fib_next
    index += 1
  end
  index
end

p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(3) == 12
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847