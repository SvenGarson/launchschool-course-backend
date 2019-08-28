=begin
  input:
    number of switches => n
  output:
    array that identifies which lights are on

  requir.:

    expl.:
      - return array with indiced of lights that are on
      - start index of on lights at 1
      - latch every light exactly arg_n times based on the multiple
      - every turn increase the base of the multiples by 1:
        1) 1,2,3,4,5..
        2) 2,4,6,8,10,..
        3) 3,6,9,12,..
      - multiples as index also start at 1

    impl.:
      -  method name: toggle_lights
      -? arg always int
      -? arg always > or >= 0
      -  arg n will be treated as always >= 1
      -  inner representation before return value of lights not
         explicitely stated, so using true and false for easy toggling

    test cases:

      inp: 5
      out: [1, 4]

      starting state:
        lights = [0,0,0,0,0]

      1) multiples of 1  with multiples [1,2,3,4,5]:
        lights = [1,1,1,1,1]
      
      2) multiples of 2 with multiples[2,4,6,..]:
        lights = [1,0,1,0,1]

      3) multiples of 3 with multiples[3,6,9]:
        lights = [1,0,0,0,1]

      4) multiples of 4 with multiples[4,8,12]:
        lights = [1,0,0,1,1]]

      5) multiples of 5 with multiples[5,10,15]:
        lights = [1,0,0,1,0]]

      final result = [1,0,0,1,0] => [1,4]

    ds and algo:

      - create lights array of n elemets initialized to false
      - iterate from 1 to n inclusive as [turn]:
         # [turn] is the base multiple
         - iterate from the base multiple to the largest multiple <= lights.size
           as [mult]:
            - [current index] = mult -1
            - invert lights[current index]
      - create array that contains the index (based on 1) of lights which are on

=end

def toggle_lights_multiples_of_base(lights, mult_base)
  mult_base.step(lights.size, mult_base) do |i|
    rindex = i - 1 
    lights[rindex] = !lights[rindex]
  end
  lights
end

def extract_light_indices(lights)
  indices = []
  lights.each_with_index { |light, i| indices << i+1 if light }
  indices
end

def toggle_lights_2(lights)
  lights = Array.new(lights, false)
  1.upto(lights.size) do |turn|
    toggle_lights_multiples_of_base(lights, turn)
  end
  extract_light_indices(lights)
end

def toggle_lights(lights)
  lights = Array.new(lights, false)
  1.step(lights.size, 1) do |turn|
    mult = turn
    while mult <= lights.size do
      curr_index = mult - 1
      lights[curr_index] = !lights[curr_index]
      mult += turn
    end
  end
  indices = []
  lights.each_with_index do |light, i|
    indices << i+1 if light
  end
  indices
end

puts '### Solution using long method and nested iteration ###'
p toggle_lights(5)
p toggle_lights(10)
p toggle_lights(0)
p toggle_lights(1)

puts '### Solution using multiple methods ###'
p toggle_lights_2(5)
p toggle_lights_2(10)
p toggle_lights_2(0)
p toggle_lights_2(1)
p toggle_lights(1000)