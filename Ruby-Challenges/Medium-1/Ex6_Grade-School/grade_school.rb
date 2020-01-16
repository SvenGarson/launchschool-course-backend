class School

  def initialize
    self.grade_student_map = Hash.new(Array.new)
  end

  def add(student_name, student_grade)
    unless grade_student_map.has_key?(student_grade)
      grade_student_map[student_grade] = Array.new
    end
    grade_student_map[student_grade] << student_name
    grade_student_map[student_grade].sort!
  end

  def grade(grade)
    grade_student_map[grade].sort
  end

  def to_h
    grade_student_map.sort.to_h
  end

  private

  attr_accessor :grade_student_map
  
end