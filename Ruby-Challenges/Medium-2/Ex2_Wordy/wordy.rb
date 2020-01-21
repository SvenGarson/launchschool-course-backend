class WordProblem

  TEXT_OPERATOR_MAP = {
   'plus'          => '+',
   'minus'         => '-',
   'multiplied by' => '*',
   'divided by'    => '/',
  }

  OPERATOR_CHARS = TEXT_OPERATOR_MAP.values;

  SYMBOL_OPERATOR_MAP = {
    '+' => :+,
    '-' => :-,
    '*' => :*,
    '/' => :/  
  }

  def initialize(problem_string)
    self.problem_string = problem_string
  end

  def answer
    replace_text_with_char_operators!
  
    numbers_and_operators = extract_signed_numbers_and_operators

    raise ArgumentError unless numbers_and_operators_valid?(numbers_and_operators)
  
    groups = extract_math_operation_groups(numbers_and_operators)
    compute_operation_groups_result(groups)
  end

  private

  def compute_operation_groups_result(operation_groups)
    accum = 0

    operation_groups.each do |group|
      operator = group.first
      operand = group.last.to_i

      accum = if operator
                [accum, operand].reduce(operator)
              else
                operand
              end
    end
    
    accum
  end

  def extract_math_operation_groups(numbers_and_operators)
    first_number = numbers_and_operators.first
    rest_numbers_and_operators = numbers_and_operators[1..-1]
    
    groups = Array.new
    groups << [nil, first_number]

    rest_numbers_and_operators.each_with_index do |candidate, index|
      # stop iteration when 2nd last object
      break unless index < (rest_numbers_and_operators.size - 1)
      # skip to next iteration if candidate not an operator
      next unless OPERATOR_CHARS.include?(candidate)
      
      operator = SYMBOL_OPERATOR_MAP[candidate]
      number = rest_numbers_and_operators[index + 1].to_i

      groups << [operator, number]
    end

    groups
  end

  def numbers_and_operators_valid?(numbers_and_operators)
    number_count = numbers_and_operators.count { |candidate| valid_integer_string?(candidate) }
    operator_count = numbers_and_operators.count { |candidate|  OPERATOR_CHARS.include?(candidate) }
    number_count > 0 && operator_count > 0
  end

  def extract_signed_numbers_and_operators
    problem_string.scan(/-?\d+|[-|\+|\*|\/]/)
  end

  def replace_text_with_char_operators!
    TEXT_OPERATOR_MAP.each do |text_operator, char_operator|
      problem_string.gsub!(text_operator, char_operator)
    end
  end

  def valid_integer_string?(number_string)
    number_string.to_i.to_s == number_string
  end

  attr_accessor(:problem_string)
  
end