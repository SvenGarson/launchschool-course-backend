require 'minitest/autorun'

require_relative 'car'

class CarTest < MiniTest::Test

  def setup
    puts "Minitest doing SETUP"
  end

  def test_wheels
    puts "Wheels"
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def test_bad_wheels
    puts "Bad wheels"
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def teardown
    puts "mintest doing DEALLOC"
  end
end