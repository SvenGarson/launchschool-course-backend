class Crypto
  def initialize(base_string)
    self.base_string = base_string
  end

  def normalize_plaintext
    base_string.gsub(/\W/, '').downcase
  end

  def size
    length = normalize_plaintext.size
    root = Math.sqrt(length).ceil
  end

  def plaintext_segments
    pattern_by_columns = Regexp.new(".{#{size}}|.+")
    normalize_plaintext.scan(pattern_by_columns)
  end

  def ciphertext
    normalize_ciphertext.gsub(/\s/, '')
  end

  def normalize_ciphertext
    segments = plaintext_segments
    segment_length = segments.first.length

    ciphertext_segments = Array.new
    
    (0...segment_length).each do |column|

      column_string = ''

      segments.each do |segment|
        segment_char = segment[column]
        column_string << segment_char if segment_char
      end

      ciphertext_segments << column_string

    end

    ciphertext_segments.join(' ')
  end

  private

  attr_accessor(:base_string)

end