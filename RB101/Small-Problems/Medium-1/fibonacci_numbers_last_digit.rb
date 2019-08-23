=begin
  input:
    -index of desired fib number in sequence ot compute
     the last digit for (starting at 1)
  output:
    - last digit of the fib number at the argument index

  requir.:

    explic.:
      method named: fibonacci_last
      arg:          index starting at 1

  ds and algo:

    - compute fib number for given index
    - fib % 10 return the digit in the ones place

=end

def fibonacci(index)

  last = [1,1]
  3.upto(index) do |_|
    fib = last.first + last.last
    last = [last.last, fib]
  end

  last.last

end

def fibonacci_last(index)
  fib = fibonacci(index);
  fib % 10
end

p fibonacci_last(15)        == 0
p fibonacci_last(20)        == 5
p fibonacci_last(100)       == 5
p fibonacci_last(100_001)   == 1
p fibonacci_last(1_000_007) == 3
# p fibonacci_last(123456789) == 4