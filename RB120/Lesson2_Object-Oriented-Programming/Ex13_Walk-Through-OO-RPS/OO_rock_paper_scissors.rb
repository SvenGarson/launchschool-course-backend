class Player

  attr_accessor :move, :name

  def initialize
    set_name
  end

  def human?
    @player_type == :human
  end

end

class Human < Player
  
  def set_name
    n = ''
      loop do
        puts "What's your name?"
        n = gets.chomp
        break unless n.empty?
        puts "Sorry, must enter something as your name."
      end
    self.name = n
  end

  def choose
    choice = nil
      loop do
        puts "Please choose rock, paper, or scissors:"
        choice = gets.chomp
        break if %w(rock paper scissors).include? choice
        puts "Sorry, invalid choice."
      end
      self.move = choice
  end

end

class Computer < Player
  
  def set_name
    self.name = %w(Hal Jerry Chappie Dumbo NokNok).sample
  end

  def choose
    self.move = %w(rock paper scissors).sample
  end

end

class RPSGame

  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end
  
  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thank you for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_winner
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}"

    puts  case human.move
          when 'rock'
            case computer.move
              when 'rock'     then "It's a tie"
              when 'paper'    then "#{computer.name} won!"
              when 'scissors' then "#{human.name} won!"
            end
          when 'paper'
            case computer.move
              when 'rock'     then "#{human.name} won!"
              when 'paper'    then "It's a tie!"
              when 'scissors' then "#{computer.name} won!"
            end
          when 'scissors'
            case computer.move
              when 'rock'     then "#{computer.name} won!"
              when 'paper'    then "#{human.name} won!"
              when 'scissors' then "It's a tie!"
            end
          end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if %w(y n).include? answer.downcase
      puts "Sorry, must be y or n."
    end
    answer == 'y' ? true : false
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end

    display_goodbye_message
  end

end

RPSGame.new.play