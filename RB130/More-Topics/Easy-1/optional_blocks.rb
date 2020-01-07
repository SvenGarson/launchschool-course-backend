def compute
  block_given? ? yield : 'Does not compute.'
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# Further exploration

def compute(some_value)
  block_given? ? yield(some_value) : nil
end

p compute('Welcome!') { |str| puts str } == nil
p compute(12) { |left_number| left_number + 5 } == 17
p compute(555) == nil