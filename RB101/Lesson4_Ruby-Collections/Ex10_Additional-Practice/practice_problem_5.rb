flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

be_index = nil

# 'manually'

flintstones.each_with_index do |name, index|
  be_index = index if name.start_with?('Be')
end

puts "Index of name that starts with 'Be' is '#{be_index}'."

# another method
be_index = flintstones.index do |name|
             name.start_with?('Be')
           end

puts "Index of name that starts with 'Be' is '#{be_index}'."