class BeerSong

  def verse(bottles)
    first_verse_for(bottles) + second_verse_for(bottles)
  end

  def verses(bottles_start, bottles_end)
    bottles_range = (bottles_end..bottles_start).to_a.reverse
    bottles_range.each_with_object(Array.new) do |bottles, accum|
      accum << verse(bottles)
    end.join("\n")
  end

  def lyrics
    verses(99, 0)
  end

  private

  def first_verse_for(bottles)
    bottle_string = case bottles
                    when 0 then 'no more bottles'
                    when 1 then "#{bottles} bottle"
                    else
                      "#{bottles} bottles"
                    end
    "#{bottle_string.capitalize} of beer on the wall, #{bottle_string} of beer.\n"
  end

  def second_verse_for(bottles)
    verse = case bottles
    when 0
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    else
      bottles_new = bottles - 1
      bottle_string = bottles_new > 1 ? 'bottles' : 'bottle'
      "Take one down and pass it around, #{bottles_new} #{bottle_string} of beer on the wall.\n"
    end
  end

end

puts BeerSong.new.lyrics