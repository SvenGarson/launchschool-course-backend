=begin
  inp
    - text file -> Sentence with markers
  out:
    - sentence with markesr replaced with appropriate type words

  requir.:

      explic.:
        - NVAA can be defines in program itself
        - text files which has text and includes markers for replacement
        - read and inject random matching word per marker
        - print result

      implic.:
        -? what format to print the final string in

    exploration:
      
      Source text
      ++++++++++
      My [adj] [noun] [verb] [adverb]
      

      - read the text fully
      - split into words space separated
      - replace each word that starts/ ends with []:
        - strip []
        - read random word from arary in hash
        - replace
      - print text

    ds and algo:

      words = {
        verb:   [x, y, z],
        adverb: [x, y, z],
        noun:   [x, y, z],
        adj:    [x, y, z]
      }

      - read text file into one string
      - split into words at space
      - for every word:
        - if start with [ and end with ] :
          -> type = word between brackets
          -> get random word from array for this type of words
          -> replace original with random word
      - join string with space again
      - print string      
  
      second approach:

      - for each key value pair in words hash:
        - replace occur of key with sample of value
      - print string that has [xyz] replaced

=end

WORDS = {
  verb: %w(running gunning shouting oozing crying driving flying sipping calling),
  adverb: %w(heavily focused crazily lighlty firmly),
  adj: %w(moist cranky handy trusty sharp expensive rare),
  noun: %w(house dog hamster bike wallet friend bed)
}

madlibs = File.read("madlibs.txt")
WORDS.each do |type, word_arr|
    madlibs.gsub!("[#{type.to_s}]") { word_arr.sample }
end

puts madlibs
