=begin
  input:
    integer > 0
  output:
    - array of integers 'between', actually inclusive based
      on given tests from 1 to number argument
  
  requirements:
    explicit:
      method named: sequence
      argument > 0

  further exploration:

    how to handle negative and zero:

    - sequence still starts at 1
    - to include numbers <= zero, build sequence
      from lowest to highest number of 1 and argument
      ceiling

    test cases:

      inp: 1
      out: [1]

        min = min(1, 1) = 1
        max = max(1, 1) = 1
        (1..1).to_a = [1]

      inp: 0
      out: [0, 1]

        min = min(0, 1) = 0      
        max = max(0, 1) = 1
        (0..1).to_a = [0,1]

      inp: -2
      out: [-2, -1, 0, 1]

        min = min(-2, 1) = -2
        max = max(-2, 1) = 1
        (-2..1).to_a = [-2, -1, 0, 1]

=end

def sequence(ceiling)
  min, max = [1, ceiling].sort
  (min..max).to_a
end

puts '### Argument range > 0 ###'
p sequence(5) == [1,2,3,4,5]
p sequence(3) == [1,2,3]
p sequence(1) == [1]

puts '### Argument range now includes neative numbers and zero ###'
p sequence(-2) == [-2,-1,0,1]
p sequence(0)  == [0,1]
p sequence(1)  == [1]