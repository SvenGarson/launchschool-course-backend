=begin

  inp:
    string
  out:
    - longest sentence in string
    - number of words in the longest sentence

  require.:

    explic.:
      - sentences end with . or ! or ?
      - spaces separate words
      - sentence ending characters separatoe sentences

    implic.:
      -? any sentence endin characters other than . ! ?
      -? handle commas af if they always are appended to
         a word for cases like word , word -> the comma would
         count as a word on it's own

  ds and algo:

    - read sentences into array
    - for every sentence:
      - count words which are space separated
      - if words > max word:
        -> update longest sentence
        -> update max count
    - print sentence and word count

=end

def longest_sentence(path)
  file_str = File.read(path)
  sentences = file_str.split(/[.!?]/)
  max_words = 0
  longest_sent = nil
  sentences.each do |sent|
    if (words = sent.split(' ').length) > max_words
      max_words = words
      longest_sent = sent
    end
  end
  puts "\n### #{path} ###"
  puts '---------------'
  print "The longest sentence is:\n#{longest_sent.strip}\nand is #{max_words} words long.\n"
end

longest_sentence('example.txt')
longest_sentence('example_2.txt')