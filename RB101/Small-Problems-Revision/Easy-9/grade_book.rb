=begin
  input:
    three integers
  output:
    return letter associated with that score

  requirements:

    explicit:
      - method named: get_grade
      - scores and character associated -> see table
      - arg score values in range [0; 100]

    implicit:
      -? compute average score based on float or integer division
      -? E is missing from the grade characters, is that a mistake or
         the way it works?

  ds and algo:

    representation of the character to score range:

    as hash map:
      store as:
        [key, value] => [range_A] => 'A'
        etc.
      then iterate the ranges and when range covers the average
      return the character that is the value for the range as key
      
    as index to an array:
      - convert average ot an index between in range [0; 4] that accesses
        the right character from an array of string right away

  algorithm:

    - compute average of scores (use floating point division for now)
    - for each range and grade character in the range_char hash:
      - if range covers the average -> return the grade character

=end

GRADE_CHAR = {
  90..100 => 'A',
  80...90 => 'B',
  70...80 => 'C',
  60...70 => 'D',
  0...60  => 'F'
}
 
def get_grade(g1, g2, g3)
  avg_f = [g1, g2, g3].reduce(:+) / 3.0
  GRADE_CHAR.each_pair do |range, char|
    return char if range.cover?(avg_f)
  end
end

p get_grade(95, 90, 93) == 'A'
p get_grade(50, 50, 95) == 'D'