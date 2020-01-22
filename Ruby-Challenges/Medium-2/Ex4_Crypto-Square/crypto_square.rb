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
    column_size = segments.first.length

    columns = Array.new

    (0...column_size).each do |column_index|
      columns << extract_column_string_at_index(segments, column_index)
    end    

    columns.join(' ')
  end

  private

  attr_accessor(:base_string)

  def extract_column_string_at_index(string_array, index)
    string_array.each_with_object(String.new) do |row_string, column_string|
      char_at_index = row_string[index]
      column_string << char_at_index if char_at_index
    end
  end

end