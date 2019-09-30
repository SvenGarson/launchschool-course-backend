=begin

inp:
- n = number of switches as Int
out:
- array with int's of light positions
  that are on, index starting at 1

exp:
- lights range [1; n]
- do n passes, from 1 to n inclusive

imp:
-? method name
-? can i use helper methods

dsal:

  >init
  - new array of n integers initialize to zero
  - for [pass] in range (1..n):
    - toggle lights at multiples of [pass]
  - result = array that contains only light positions
    that are 'on'

  >pseudo
  - lights = new Array with n bools set to false
  - n times from 1 to n [i]:
    - i.step(n, n) as [k]:
      - curr = lights[j]
      - lights[j] = !curr
  - result = []
  - for each index in lights:
    - if curr light true add index + 1 to result
  - return result

  ->

  >refactored
  - lights = new array with n bools set to false
  - sequence.each do |index|:
    - toggle bool at index
  - result =  []
  - lights each with index [o, i]
    result << (i+1) if o
  
=end

def button_sequence(lights)
  sequence = []
  1.upto(lights) do |pass|
    pass.step(lights, pass) do |j|
      sequence << (j - 1)
    end
  end
  sequence
end

def extract_on_lights(lights)
  on_lights = []
  lights.each_with_index do |state, i|
    on_lights << (i+1) if state
  end
  on_lights
end

def toggle_lights_by_sequence(lights)
  button_sequence(lights.length).each do |rindex|
    lights[rindex] = !lights[rindex]
  end
end

def toggle_lights(lights)
  light_ar = Array.new(lights, false)
  toggle_lights_by_sequence(light_ar)
  extract_on_lights(light_ar)
end

p toggle_lights(5) == [1, 4]
p toggle_lights(10) == [1, 4, 9]