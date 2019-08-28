=begin
  input:
    number

  output:
    if arg number > 0   -> return negative of arg
    if arg number <= 0  -> return             arg

  requirements:
    explicit:
      methods named: negative

=end

def negative(number)
  number > 0 ? -number : number
end

p negative(5)  == -5
p negative(-3) == -3
p negative(0)  ==  0