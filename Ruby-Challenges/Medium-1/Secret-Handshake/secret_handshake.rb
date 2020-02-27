class SecretHandshake
  REVERSE_MASK = '10000'.to_i(2)

  MASK_COMMAND_MAP = {
    '1'.to_i(2)    => 'wink',
    '10'.to_i(2)   => 'double blink',
    '100'.to_i(2)  => 'close your eyes',
    '1000'.to_i(2) => 'jump',
    REVERSE_MASK   => nil
  }

  def initialize(secret_number)
    self.secret_number = secret_number_to_int(secret_number)
  end

  def commands
    command_list = Array.new

    MASK_COMMAND_MAP.each do |command_mask, command_string|
      includes_command = (secret_number & command_mask) > 0
      next unless includes_command == true

      if command_mask == REVERSE_MASK
        command_list.reverse!
      else
        command_list << command_string
      end
    end

    command_list
  end

  private

  def secret_number_to_int(secret_number)
    if secret_number.class == String
      secret_number.to_i(2)
    else
      secret_number
    end
  end

  attr_accessor(:secret_number)
end
