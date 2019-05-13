# fixed factors method
def factors(number)
  factors = []
  for num in (1..number)
    factors << (number/num) if (number % num == 0)
  end
  factors
end

# test cases for negative, zeor and positive arguments
p factors(-25)
p factors(0)
p factors(25)

=begin 

Bonus 1)
The purpose of the (number % divisor == 0) is to check
whether number is divisible by divisor without remainder

Bonus 2)
The purpose is to 'explicitly' return the array instead
of whatever line was last executed when the method is done

=end