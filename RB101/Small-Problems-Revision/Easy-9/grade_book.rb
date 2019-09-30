=begin

inp:
- 3 scores in the range [0; 100]

out:
- letter associated with that grade

exp:
- character and grade range:
  - F -> [0;  60  [
  - D -> [60; 70  [
  - C -> [70; 80  [
  - B -> [80; 90  [
  - A -> [90; 100]

imp:
-? input score always int
-? does between mean 0 and 100 included
   in input range
-! assuming floating point math for higher
   precision by default

dsal:

  >pseudo
  - avg = (a + b + c) / 3.0
  - get and return character based on average

  retreiving a character for a grade average:
  
    inp: grade average (float)
    out: character string

    a hash withe K,V pairs where
      - key is a range for that grade char
      - value if the grade char
    that works well if the ranges dont overlap

  >determining grade char from [range, grade char] hash:
  - for each range in hash keys:
    - if range covers the average computed:
      -> return grade char associated with that range

  further exploration: adding more ranges and grades:

  - adding 101..104 to be 'A+'
  - adding 105 to be 'Aced'

=end

GRADE_HSH = {
  (105..105)  => 'Aced',
  (101...105) => 'A+'.freeze,
  (90..100)   => 'A'.freeze,
  (80...90)   => 'B'.freeze,
  (70...80)   => 'C'.freeze,
  (60...70)   => 'D'.freeze,
  ( 0...60)   => 'F'.freeze,
}

def get_grade(a, b, c)
  avg = (a + b + c).fdiv(3)
  matching = GRADE_HSH.keys.select { |rng| rng.cover?(avg) }
  # just assume that one range will cover the average
  GRADE_HSH[matching.first]
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
p get_grade(103, 102, 105) == 'A+'
p get_grade(105, 105, 105) == 'Aced'