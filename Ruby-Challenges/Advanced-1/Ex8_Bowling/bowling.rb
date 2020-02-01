class Frame
  STRIKE = :strike
  SPARE = :spare
  OPEN = :open
  FINAL = :final
  NONE = :none

  STRIKE_SCORE = 10

  attr_reader(:state, :throw_scores)

  def initialize
    self.state = NONE
    self.throw_scores = Array.new
  end

  def done?
    state != NONE
  end

  def score
    throw_scores.sum
  end

  def self.next_throws_to_sum_for_state(result)
    case result
    when STRIKE then 2
    when SPARE  then 1
    else
      0
    end
  end

  def to_s
    str = ''
    str << "Frame #{self.class}\n ===> #{state}\n"
    throw_scores.each_with_index do |score, index|
     str << "#{index}) #{score}\n"
    end
    str << '-' * 50 + "\n"
    str
  end

  private

  def result
    if first_throw_strike?
      STRIKE
    elsif spare?
      SPARE
    elsif open?
      OPEN
    else
      NONE
    end
  end

  def open?
    throws_total == 2 && throw_scores[0, 2].sum < STRIKE_SCORE
  end

  def spare?
    throws_total == 2 && throw_scores[0, 2].sum == STRIKE_SCORE
  end

  def first_throw_strike?
    throw_scores.first == STRIKE_SCORE
  end

  def throws_total
    throw_scores.size
  end

  def record_throw_score(score)
    throw_scores << score
  end

  attr_writer(:state, :throw_scores)
end

class NormalFrame < Frame

  def roll(pins_knocked)
    record_throw_score(pins_knocked)

    # done when first strike, of both either spare or open
    throw_result = result
    self.state = throw_result if throw_result != NONE 
      
  end

end

class FinalFrame < Frame

  def roll(pins_knocked)
    record_throw_score(pins_knocked)

    # done when after second throw, no strike of spare
    if (throws_total == 2 && ![STRIKE, SPARE].include?(result)) || throws_total == 3
      self.state = FINAL
    end
  end

end

class Game

  TOTAL_FRAMES = 10

  def initialize
    init_frames
  end

  def roll(pins_knocked)
    if frame_valid?
    
      current_frame.roll(pins_knocked)
      
      if current_frame.done?
        next_frame
      end
    end

  end

  def score
    score = 0
    
    frames.each_with_index do |frame, frame_index|
      next_throws_to_add = Frame.next_throws_to_sum_for_state(frame.state)
      score += frame.score + sum_of_next_n_throws(frame_index, next_throws_to_add)
    end
      
    score
  end

  private

  def sum_of_next_n_throws(current_frame_index, next_throws)
    gathered_throw_scores = Array.new

    frames[(current_frame_index + 1)..-1].each do |next_frame|
      gathered_throw_scores.concat(next_frame.throw_scores)

      
      # gathered enough?
      break if gathered_throw_scores.size >= next_throws
    end
    
    gathered_throw_scores[0, next_throws].sum
  end

  def over?
    frames.last.done?
  end

  def current_frame
    frames[current_frame_index]
  end

  def frame_valid?
    current_frame_index < TOTAL_FRAMES
  end

  def next_frame
    self.current_frame_index = current_frame_index + 1
  end

  def init_frames
    self.frames = Array.new
    (TOTAL_FRAMES - 1).times { |_| frames << NormalFrame.new }
    frames << FinalFrame.new
    self.current_frame_index = 0
  end

  attr_accessor(:frames, :current_frame_index)

end