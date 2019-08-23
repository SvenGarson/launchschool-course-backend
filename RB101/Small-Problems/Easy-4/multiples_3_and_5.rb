def divisible?(number, divisor)
  number % divisor == 0
end

def multisum(ceiling)
   (1..ceiling).inject(0) do |sum, i|
    if divisible?(i, 3) || divisible?(i, 5)
      sum + i
    else
      sum
    end
  end
end

p multisum(3)   == 3
p multisum(5)   == 8
p multisum(10)  == 33
p multisum(1000) == 234168