=begin

== Shift Cipher ==

  # encode message to cipher by shifting chars right by X-1
  # decode cipher to message by shifting chars left  by X-1

  alphabe : abcdefghijklmnopqrstuvwxyz
  message : cdefg
  shift(X): 4
  ciphert : zabcd

== Substitution Cipher ==

  - as in the example, that's not substitution

  key: aaaaa
  
  this key denotes the distance to shift char at that
  index

  key           : a a a a
  1st char distance from A = shift for A
  2nd char distance from A = shift for B
  3nd char distance from A = shift for C
  etc

  shifts (a - ?): 0 0 0 0
  cipher alpha  : a b c d

  key           : d d d d
  shifts        : 3 3 3 3
  cipher alpha  : d e f g
  alpha         : a b c d
  
  inp: a
  end: d

  > questions
  - can cipher alphabet not contains duplicate chars?

== Random Subs Cipher Key ==

  - generating key containing [a-z] chars only of any length
    but it has to contains at least one of all chars
  - 

=end