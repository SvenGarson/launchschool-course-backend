=begin

  1. read file 
  2. get numbers as in example
  3. generat info output of same format
  4. try custome file example

  - read text file in TextAnalyzer#process method
  - count: paragraphs, lines and words

  output format:

  X paragraphs
  Y lines
  Z words

=end

class TextAnalyzer
  def process(filename)

    # read file
    text = File.read(filename)

    # block processes file and returns a string
    result = yield(text)

    # output string block returned
    puts result
  end
end

puts "\nAnalyzing given sample_text"
puts "---------------------------"

sample_filename = 'sample_text.txt'

analyzer = TextAnalyzer.new
analyzer.process(sample_filename) do |text|
  paragraph_count = text.split("\n\n").size
  "#{paragraph_count} paragraphs"
end

analyzer.process(sample_filename) do |text|
  line_count = text.count("\n") + 1
  "#{line_count} lines"
end

analyzer.process(sample_filename) do |text|
  word_count = text.split.size
  "#{word_count} words"
end

puts "\nAnalyzing custom text"
puts "---------------------"

sample_filename = 'custom_text.txt'

analyzer = TextAnalyzer.new
analyzer.process(sample_filename) do |text|
  paragraph_count = text.split("\n\n").size
  "#{paragraph_count} paragraphs"
end

analyzer.process(sample_filename) do |text|
  line_count = text.count("\n") + 1
  "#{line_count} lines"
end

analyzer.process(sample_filename) do |text|
  word_count = text.split.size
  "#{word_count} words"
end

puts ''

=begin

  custom text should output:

  5 paragraphs
  10 lines
  25 words

=end