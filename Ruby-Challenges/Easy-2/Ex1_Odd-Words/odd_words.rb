def oddify(string)
  string = string[/\w[\w ]*\./]
  words = string.scan(/\S+/)
  words.each_with_index do |word, index|
    next if index.even?
    word.reverse!
  end
  words.map! do |word|
    if word.length > 20
      word[0, 20]
    else
      word
    end
  end
  if words.last == '.'
    words[0..-2].join(' ') + words.last
  else
    words.join(' ')
  end
end

p oddify('whats the matter with kansas.') == 'whats eht matter htiw kansas.'
p oddify('  123456789X1234567890 ABC 123456789X1234567890AB     .') == ('123456789X1234567890 CBA 123456789X1234567890.')