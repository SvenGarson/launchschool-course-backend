ROCK = 'rock'
PAPER = 'paper'
SCISS = 'scissors'
RES_PLAYER_WIN = 'You won!'
RES_COMP_WIN = 'Computer won!'
RES_TIE = "It's a tie"

VALID_CHOICES = [ROCK, PAPER, SCISS]

RULESET = {
  ROCK  =>
        {
          ROCK  => RES_TIE,
          PAPER => RES_COMP_WIN,
          SCISS => RES_PLAYER_WIN
        },
  PAPER =>
        {
          ROCK  => RES_PLAYER_WIN,
          PAPER => RES_TIE,
          SCISS => RES_COMP_WIN
        },
  SCISS =>
        {
          ROCK  => RES_COMP_WIN,
          PAPER => RES_PLAYER_WIN,
          SCISS => RES_TIE
        }
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def get_result(player, computer)
  # return string result based on ruleset hash
  RULESET[player][computer]
end

loop do
  choice = ''

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample()

  Kernel.puts("You chose: #{choice}; Computer chose: #{computer_choice}")

  puts get_result(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Goodbye!")
