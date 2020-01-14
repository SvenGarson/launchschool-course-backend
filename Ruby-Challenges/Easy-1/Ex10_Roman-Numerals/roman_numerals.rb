class Integer

  VALUE_NUMERAL_TABLE = [
    [1,    'I'],
    [4,   'IV'],
    [5,    'V'],
    [9,   'IX'],
    [10,   'X'],
    [40,  'XL'],
    [50,   'L'],
    [90,  'XC'],
    [100,  'C'],
    [400, 'CD'],
    [500,  'D'],
    [900, 'CM'],
    [1000, 'M']
  ].reverse.freeze

  def to_roman
    rest = self
    roman_string = ''
    until rest == 0
      value_numeral = highest_value_numerable_for_number(rest)
      rest -= value_numeral.first
      roman_string << value_numeral.last
    end
    roman_string
  end

  private

  def highest_value_numerable_for_number(number)
    VALUE_NUMERAL_TABLE.find { |vnum| number / vnum.first >= 1 }
  end

end