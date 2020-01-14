class SecretHandshake
  def initialize(number)
    @number = number.class == String ? number.to_i(2) : number
  end

  def commands
    commands = Array.new
    
    commands << 'wink' if (number & 0x01) > 0
    commands << 'double blink' if (number & 0x02) > 0
    commands << 'close your eyes' if (number & 0x04) > 0
    commands << 'jump' if (number & 0x08) > 0
    commands.reverse! if (number & 0x10) > 0
    commands
  end

  private

  attr_reader :number
end