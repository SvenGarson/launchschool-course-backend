class House
  def self.recite
    House.new.recite
  end

  def recite
    rhyme_pieces = pieces
    full_rhyme = Array.new

    1.upto(rhyme_pieces.size) do |verse|
      verse_lyrics = rhyme_pieces[-verse..-1].flatten
      verse = Array.new

      # verse first line
      verse << "This is " + verse_lyrics.first

      # verse rest lines
      verse.concat(rest_of_lines(verse_lyrics))

      full_rhyme << verse.join("\n")
    end

    full_rhyme.join(".\n\n") + ".\n"
  end

  private

  def rest_of_lines(verse_lyrics)
    verse_lyrics[1..-1].each_slice(2).map do |next_line|
      next_line.join(' ')
    end
  end

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end
