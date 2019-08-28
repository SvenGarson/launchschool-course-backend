def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(' ')
end

str = 'hello world'
puts "str id: #{str.object_id}"

result = spin_me(str)
test = result == 'olleh dlrow'
puts "result id: #{result.object_id}"
puts "test succeed: #{test}"