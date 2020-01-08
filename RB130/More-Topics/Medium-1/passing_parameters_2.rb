def select_raptors(bird_array)
  yield(bird_array)
end

birds = %w(raven finch hawk eagle)

result = select_raptors(birds) do |_, _, c, d|
  [c, d]
end

p result == birds[-2..-1]