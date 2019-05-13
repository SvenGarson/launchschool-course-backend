=begin

  A) Local variables in method are re-assigned

  one is: one
  two is: two
  three is: three

  B) Local variables in method are again re-assigned

  one is: one
  two is: two
  three is: three

  C) The outer string are mutated because gsub! is a
     'destructive' method and replaces parts of the string
     with a new one.

  one is: two
  two is: three
  three is: one

=end

