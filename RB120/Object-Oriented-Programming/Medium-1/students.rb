class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student # 1st change
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student # 2nd change
  # 3d change: constructor omitted, same as Student#initialize
end