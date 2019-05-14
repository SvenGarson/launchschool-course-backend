def my_titleize(string)
  titleized = ''
  string.split(' ').each_with_index do |word, index|
    titleized << ' ' unless index == 0
    titleized << word.capitalize
  end
  titleized
end

words = 'the flintstones rock'
words_titleized = my_titleize(words)

puts words_titleized

puts '============================'

# another method

def my_titleize_two(string)
  string.split(' ').map{|word| word.capitalize}.join(' ')
end

words = 'the flintstones rock'
words_titleized = my_titleize_two(words)

puts words_titleized

