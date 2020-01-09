require 'minitest/autorun'
require_relative 'resources/text.rb'

class TextTest < Minitest::Test
  
  def setup
    @string = IO.read('resources/sample_text.txt')
  end

  def test_swap
    text = Text.new(@string)

    assert(@string.split.count, text.word_count)
  end

  def teardown

  end

end