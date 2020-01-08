def step(floor, ceiling, step)
  loop do
    yield(floor)
    break if (floor + step) > ceiling
    floor += step
  end
  floor
end

ret = step(1, 10, 3) { |value| puts "value =  #{value}"}
p ret == 10