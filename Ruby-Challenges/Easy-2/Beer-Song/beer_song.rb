class BeerSong
  MAX_BOTTLES_ON_WALL = 99

  MARKER_BOTTLE_COUNT = "#BOTTLE_COUNT"
  MARKER_TAKE = "#TAKE"

  MARKED_LINE_1 = "#{MARKER_BOTTLE_COUNT} of beer on the wall, \
#{MARKER_BOTTLE_COUNT} of beer.\n".freeze
  MARKED_LINE_2 = "#{MARKER_TAKE} down and pass it around, \
#{MARKER_BOTTLE_COUNT} of beer on the wall.\n".freeze
  MARKED_LINE_2_RESET = "Go to the store and buy some more, \
#{MARKER_BOTTLE_COUNT} of beer on the wall.\n".freeze

  def lyrics
    verses(MAX_BOTTLES_ON_WALL, 0)
  end

  def verses(bottles_start, bottles_end)
    verses = ''

    bottles_start.downto(bottles_end) do |bottles|
      verses << verse(bottles) + "\n"
    end

    verses.chomp!
  end

  def verse(bottles)
    first_line(bottles) + second_line(bottles)
  end

  def bottle_count_string(bottles)
    case bottles
    when 0 then 'no more bottles'
    when 1 then '1 bottle'
    else
      "#{bottles} bottles"
    end
  end

  def take_string(bottles)
    case bottles
    when 0 then nil
    when 1 then 'take it'
    else
      'take one'
    end
  end

  def first_line(bottles)
    bottle_string = bottle_count_string(bottles)
    MARKED_LINE_1.gsub(MARKER_BOTTLE_COUNT, bottle_string).capitalize
  end

  def second_line(bottles)
    if bottles > 0
      second_line = MARKED_LINE_2.dup
      second_line.gsub!(MARKER_TAKE, take_string(bottles))
      # one less bottle after taking one down
      second_line.gsub!(MARKER_BOTTLE_COUNT, bottle_count_string(bottles - 1))
      second_line
    else
      # after buying some more, max bottles on wall again
      bottle_string = bottle_count_string(MAX_BOTTLES_ON_WALL)
      MARKED_LINE_2_RESET.gsub(MARKER_BOTTLE_COUNT, bottle_string)
    end.capitalize
  end
end
