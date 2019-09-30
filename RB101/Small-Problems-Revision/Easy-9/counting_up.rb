=begin

Further exploration, whet if argument is 
not > 0?

  Define requirements:
  
  if arg 0  , then return sequence [1, 0]
  if arg < 0, then return sequence [1, 0, -1, -2, ..]

  so if arg > 0:
    -> return range (1..arg)
  else:
    -> (arg..1) reversed

=end

def sequence(ceiling)
  if ceiling > 0
    (1..ceiling).to_a
  else
    (ceiling..1).to_a.reverse
  end
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(0) == [1, 0]
p sequence(-3) == [1, 0, -1, -2, -3]