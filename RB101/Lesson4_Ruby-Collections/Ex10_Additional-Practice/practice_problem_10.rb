KEY_AGE_GROUP = 'age_group'
GROUP_KID = 'kid'
GROUP_ADULT = 'adult'
GROUP_SENIOR = 'senior'

munsters = {
  'Herman' => { 'age' => 32, 'gender' => 'male'},
  'Lily' => { 'age' => 30, 'gender' => 'female'},
  'Grandpa' => { 'age' => 402, 'gender' => 'male'},
  'Eddie' => { 'age' => 10, 'gender' => 'male'},
  'Marilyn' => { 'age' => 23, 'gender' => 'female'}
}

# iteration
munsters.each_pair do |name, attribs|
  group = case attribs['age']
          when (0..17)  then GROUP_KID
          when (18..64) then GROUP_ADULT
          else               GROUP_SENIOR
  end
  attribs[KEY_AGE_GROUP] = group
end

munsters.each_pair do |name, attribs|
  print "#{name} => "
  p attribs
end