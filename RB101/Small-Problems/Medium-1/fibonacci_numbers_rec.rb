=begin
  input:
    nth fib number index, staring at one
  output:
    fib number at that index


  requir.:

    explic.:
      method name: fibonacci
      arg:         index of desired fib number
      recursive solution!

  test cases:

    1, 1 => 1+1 = 2   --> 1
    1, 2 => 1+2 = 3   --> 2
    2, 3 => 2+3 = 5   --> 3
    3, 5 => 3+5 = 8   --> 4

    - exit condition: when index reached, computed number is the result


  [l1, l2]
  iteration = 1


  - current last [L, R]
  - current index (1..?)
  - fib = L + R
  - if current index == arg -> return fib
  - else fib(L = R, R = fib, curr index + 1

  arg = 3
  1)fib(arg, L = 1, R = 1, index = 1)
    fib = L + R
    fib(3, R, fib, index+1)

  2) -> fib(3, 1, 2, 2)
    fib = 1 + 2 = 3
    fib(3, 2, 3, 3)

  3) -> fib(3, 2, 3, 3)
     fib = 2 + 5 = 5
     <-fib

  1) [0,0]
    if index == 1 then fib = 1
  2) [0, 1]
    fib = 0 + 1 = 1
  3) [1, 1]
    fib = 1 + 1 = 2
  4) [1, 2]

 ds and algo:

  method protype = fib(arg_index, last_first = 0, last_second = 0, index = 1)
    -> if index == 1
        -> fib = 1
    -> else
        -> fib = last_first + last_second
    -> if index == arg_index:
        -> return fib
    -> else
        -> fib(arg_index, last_second, fib, index+1)

=end

def fibonacci(index, last_left = 0, last_right = 0, curr_index = 1)
  
  fib = case curr_index
        when 1 then fib = 1
        else        fib = last_left + last_right
        end
  if index == curr_index
    fib
  else
    fibonacci(index, last_right, fib, curr_index + 1)
  end
end

p fibonacci(1)  == 1
p fibonacci(2)  == 1
p fibonacci(3)  == 2
p fibonacci(4)  == 3
p fibonacci(5)  == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765