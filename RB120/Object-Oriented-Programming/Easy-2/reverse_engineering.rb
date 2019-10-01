class Transform

  def initialize(string)
    @data = string
  end

  def self.lowercase(str)
    str.downcase
  end

  def uppercase
    @data.upcase
  end

end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')
