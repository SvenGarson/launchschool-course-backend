class Crypto
  include Math

  def initialize(english_string)
    self.english_string = english_string
  end

  def normalize_plaintext
    english_string.scan(/\w/).join.downcase
  end

  def size
    normalized_string_length = normalize_plaintext.length

    if perfect_square?(normalized_string_length)
      sqrt(normalized_string_length).floor
    else
      next_highest_perfect_square_base(normalized_string_length)
    end
  end

  def plaintext_segments
    normalize_plaintext.chars.each_slice(size).map(&:join)
  end

  def normalize_ciphertext
    padded_plaintext_segments = padd_to_max_length(plaintext_segments)
    transposed_segment_chars = padded_plaintext_segments.map(&:chars).transpose
    transposed_segments = transposed_segment_chars.map(&:join)
    transposed_segments.map { |segment| segment.scan(/\w/).join }.join(' ')
  end

  def ciphertext
    normalize_ciphertext.split.join
  end

  private

  def padd_to_max_length(segments)
    max_length = segments.map(&:length).max
    segments.map { |segment| segment.ljust(max_length) }
  end

  def perfect_square?(number)
    sqrt(number) % 1.0 == 0
  end

  def next_highest_perfect_square_base(number)
    sqrt(number).ceil
  end

  attr_accessor(:english_string)
end
