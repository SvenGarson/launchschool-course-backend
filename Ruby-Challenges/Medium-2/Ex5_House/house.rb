class House

  def self.recite
    total_verses = pieces.size

    rhyme = ''

    1.upto(total_verses) do |nth_verse|
      first_line, rest_lines = first_and_rest_lines_for_verse(nth_verse)
      
      rhyme << "This is #{first_line}\n"
      
      each_exclusive_pair(rest_lines) do |left, right|
        rhyme << "#{left} #{right}\n"
      end

      rhyme[-1] = ".\n\n"

    end

    rhyme.chomp!
    rhyme
  end

  private

  def self.each_exclusive_pair(array)
    0.step(array.size-2, 2) do |base_index|
      left = array[base_index]
      right = array[base_index + 1]
      yield(left, right)
    end
  end

  def self.first_and_rest_lines_for_verse(nth_verse)
    verses = pieces[-nth_verse..-1].flatten
    first_line = verses.first
    rest_lines = verses[1..-1]
    [first_line, rest_lines]
  end

  def self.pieces
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