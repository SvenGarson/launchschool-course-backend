=begin
  
  inp:
    - string of digits
  out:
    - number as integer

  exp:
    - cannot use String#to_i and Integer constructor
    - method name string_to_integer
    - no input validation
    - no + or - sign prepended
    - all characters in string numeric / digits

  ds and algo:

    - multiplier = 1
    - accum = 0
    - for each [digit] in string, right to left:
                                  ^^^^^^^^^^^^^
      - dig = digit ascii - 0 ascii
      - accum += dig * multiplier
      - multiplier *= 10
    - return number

  further exploration:

    inp:
      - string of hexadecimal representation
    out:
      - decimal integer value of that hexadecimal

    exp:
      - method name: hexadecimal_to_integer
    imp:
      -? still don't use any built-in conversion method
      -? work with upper and lowecase A - F characters
    
    ds and algo:
      
      - accum = 0
      - hex string to char array
      - replace each char with it's decimal represenation
      - reverse the array
      - for each [decimal] in the array for [index]:
        - base = 16 ** index
        - accum += decimal * base
      - return accum

      test cases:
      
      inp: 4D9f
      out: 19871

      - accum = 0
      - %w( 4 d 9 f)
      - %w( 4 13 9 15)
      - %w(15 9 13 4)
      - 0) base = 1  | decimal = 15 | accum = 0 + 15
        1)        16   decimal = 9  | accum = 15 + 16 * 9

=end

HEX_HSH = {
  '0'=>0,  '1'=>1, '2'=>2, '3'=>3,  '4'=>4,  '5'=>5,  '6'=>6,
  '7'=>7,  '8'=>8, '9'=>9, 'A'=>10, 'B'=>11, 'C'=>12, 'D'=>13,
  'E'=>14, 'F'=>15
}

=begin
      - accum = 0
      - upcase string
      - hex string to char array
      - replace each char with it's decimal represenation
      - reverse the array
      - for each [decimal] in the array for [index]:
        - base = 16 ** index
        - accum += decimal * base
      - return accum
=end

def hexadecimal_to_integer(hex_str)
  decimals_inv = hex_str.upcase.chars.map! { |hex| HEX_HSH[hex] }.reverse!
  accum = 0
  decimals_inv.each_with_index do |dec, index|
    base = 16 ** index
    accum += dec * base
  end
  accum
end

def string_to_integer(num_str)
  mult = 1
  accum = 0
  for char in num_str.chars.reverse
    dig = char.ord - '0'.ord
    accum += dig * mult
    mult *= 10
  end
  accum
end

puts '### Solution first problem ###'
p string_to_integer('4321') == 4321
p string_to_integer('570')  == 570

puts '### Solution further exploration ###'
p hexadecimal_to_integer('4D9f') == 19871
