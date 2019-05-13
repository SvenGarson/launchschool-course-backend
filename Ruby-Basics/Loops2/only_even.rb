number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end

=begin

  if next were placed before the incrementation
  of number, then the first iteration would increment
  number from 0 to 1, and from the second iteration on
  the number.off? would succeed and gpo to the next iteraion,
  never incrementing number.

  That means it would print 1, and then nothing anymore, but
  being stuck in an infinite loop.

=end