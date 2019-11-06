class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

cat_1 = AngryCat.new(3, 'Mia')
cat_2 = AngryCat.new(4.5, 'Sophia')

puts "\nDifferent names"
cat_1.name
cat_2.name

puts "\nDifferent ages"
cat_1.age
cat_2.age