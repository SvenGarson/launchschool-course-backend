=begin

inp:
- number
out:
- always return negative number of arg

dsal:

  if number > 0 -> return -(number)
  if number <=  -> return   number

=end

def negative(number)
  (number > 0) ? -number : number
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0