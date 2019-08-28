print 'Please write word or multiple words: '
input = gets.chomp

character_count = input.split(' ').join.size

puts "There are #{character_count} characters in \"#{input}\""