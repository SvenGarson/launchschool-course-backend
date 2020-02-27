class School
  def initialize
    self.grade_student_map = Hash.new
  end

  def add(student_name, grade)
    unless grade_student_map.key?(grade)
      grade_student_map[grade] = Array.new
    end

    grade_student_map[grade] << student_name
  end

  def to_h
    sorted_grades = grade_student_map.sort

    sorted_grades_and_names = sorted_grades.map do |grade, names|
      [grade, names.sort]
    end

    sorted_grades_and_names.to_h
  end

  def grade(grade)
    grade = to_h[grade]

    return [] unless grade

    grade
  end

  private

  attr_accessor(:grade_student_map)
end
