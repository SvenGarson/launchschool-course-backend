=begin
  inp:
    1) string -> text ot repeat
    2) int >0 -> repetitions
  out:
    print string n times on a new line

  requir.:
    explic.:
      - method name: repeat
    implic.:
      -! one word per line

=end

def repeat(string, n)
  n.times { puts string }
end

repeat('Hello', 3)