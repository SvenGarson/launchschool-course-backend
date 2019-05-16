# write some code to return a new array containing:
# the COLORS of the FRUITS      -> should be capitalized
# the SIZES  of the VEGETABLES  -> should be uppercased

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

result = hsh.map do |_, value|
            case value[:type]
            when 'fruit'
              value[:colors].map do |color|
                color.capitalize
              end
            when 'vegetable'
              value[:size].upcase
            end
          end

p '=== Original ==='
p hsh
p '=== Result ==='
p result