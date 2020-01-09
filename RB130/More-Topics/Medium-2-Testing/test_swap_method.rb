require 'minitest/autorun'
require_relative 'resources/text.rb'

class TextTest < Minitest::Test
  
  def setup
    @string = IO.read('resources/sample_text.txt')
    @text = Text.new(@string)
  end

  def test_swap
    expected_string = @string.gsub('a', 'e')
    result_string =  @text.swap('a', 'e')
    
    assert_equal(0, result_string.count('a'))
    assert_equal(expected_string, result_string)
  end

  def teardown

  end

end