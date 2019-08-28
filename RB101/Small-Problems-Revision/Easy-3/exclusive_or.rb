def xor?(a, b)
  #a ? !b : b
  #a ? b==false : b==true
  (a && !b) || (!a && b)
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false

=begin

  Yes the xor method does perform short circuit.
  If the a in ( a && !b ) is falsey, the statement is
  short circuited in that it does not need to know anything
  else to eqvaluate the valu eof the whole ( a && !b )
  since both operands need to be true.

  The program then takes the resultin valu eof the whole
  (a && !b) as the left operand for the next logical
  comparison with || or. In case the value of ( a && !b)
  is truthy, again, the test is short circuited, since only
  one of the ||'s operators needs to be true in order for
  to evaluate to a truthy value.

  The short circuiting does make sense in the given solution,
  but for the xor operation to be evaluated, both operands will
  need to be checked for opposing values. The purpose of the
  short circuiting in this case is only to select the right
  check, based on if the first operand, a, is true or not.


=end