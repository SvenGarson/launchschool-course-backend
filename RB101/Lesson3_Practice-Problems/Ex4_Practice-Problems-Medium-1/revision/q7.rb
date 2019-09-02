=begin
  since ruby is pass by reference value, and the each
  method iterates the actual references to the nested
  hashes for each family member and the lines 11 and 12
  use mutative assignment methods on those references, 
  the data inside the external munsters hash is mutated,
  where each age is incremented by 42 and each gender set
  to the string 'other'
=end