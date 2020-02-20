class BeerSong
  def verse(start_bottles, end_bottles = nil)
    end_bottles  = end_bottles ? end_bottles : start_bottles
    
    start_bottles.upto(end_bottles) do |b|
      p b
    end

  end
end

BeerSong.new.verse(2)
BeerSong.new.verse(98, 64)
BeerSong.new.verse(3, 1)