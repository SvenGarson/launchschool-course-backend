=begin
  The difference is that the << operator mutates the array
  passed into the method, whereas the + operator does concatenate
  the two arrays into one new array, which has no effect on the
  original array
=end

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

buff = [1,2,3,4,5]

# rolling_buffer2 does not mutate buff
p buff
rolling_buffer2(buff, 5, 66)
p buff

# rolling_buffer1 does mutate buff
rolling_buffer1(buff, 5, 66)
p buff