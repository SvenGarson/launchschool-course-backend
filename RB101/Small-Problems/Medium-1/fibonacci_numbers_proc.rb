=begin
  
  re-implement the fibonacci method from the previous exercise
  without recursion, i.e, procedural

=end

def fibonacci(index)

  last = [1,1]
  3.upto(index) do |_|
    fib = last.first + last.last
    last = [last.last, fib]
  end

  last.last

end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
fib_str = fibonacci(100_001).to_s
p fib_str.start_with?('4202692702')
p fib_str.reverse.start_with?('1057357079669795828')