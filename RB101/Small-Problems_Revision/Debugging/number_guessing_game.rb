def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

  loop do
    attempts += 1
    break if attempts > max_attempts

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
      # guess right, exit loop
      break
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number
      # try again by letting the loop until all tries used up
    end
  end
end

guess_number(10, 3)

=begin
  The first obvious problem is that when we win, the game does not stop,
  it just keeps going. That is fixed by breaking out of the loop in line
  24, but in case the the guess is wrong, the method calls itself
  recursively, at which point a new scope is created and the new method 
  gets it's own set of local variables. This is not the main problem
  though, as on every unsuccesfull guess, the game runs itself once more,
  and in order to win 'the game / all the games' and with the first fix in
  line 24 in place, on winning each one would return from the recursive
  call and in turn go levels back/up the recursion hierarchy and finally
  exit the initial loop and be done with it.
=end