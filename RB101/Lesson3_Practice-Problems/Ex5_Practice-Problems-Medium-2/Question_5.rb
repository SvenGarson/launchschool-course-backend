=begin
  
  just use the boolean test as the return value

=end

def color_valid(color)
  if color == 'blue' || color == 'green'
    true
  else
    false
  end
end

def color_valid_better(color)
  color == 'blue' || color == 'green'
end

BLUE = 'blue'
GREEN = 'green'
YELLOW = 'yellow'

test_a = color_valid(BLUE) == color_valid_better(BLUE)
test_b = color_valid(GREEN) == color_valid_better(GREEN)
test_c = color_valid(YELLOW) == color_valid_better(YELLOW)

puts "Test a success: #{test_a}"
puts "Test b success: #{test_b}"
puts "Test c success: #{test_c}"