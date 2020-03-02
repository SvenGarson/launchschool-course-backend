class WordProblemOperator
  attr_reader(:operator)

  def initialize(operator)
    @operator = operator
  end
end

class WordProblemNumber
  attr_reader(:number)

  def initialize(number)
    @number = number
  end
end

class WordProblem
  OPERATORS = {
    'plus'          => :+,
    'minus'         => :-,
    'multiplied by' => :*,
    'divided by'    => :/
  }

  def initialize(word_problem_string)
    self.word_problem_string = word_problem_string
  end

  def answer
    sequence = number_and_operator_sequence

    raise ArgumentError unless valid_number_and_operator_sequence?(sequence)

    operator = nil
    right_operand = nil
    accum = sequence.first.number

    # send operator +-*/ message to accumulator with number as argument
    sequence[1..-1].each do |step|
      if word_problem_operator?(step)
        operator = step.operator
      elsif word_problem_number?(step)
        right_operand = step.number
        accum = accum.public_send(operator.to_s, right_operand)
      end
    end

    accum
  end

  private

  def word_problem_number?(object)
    object.is_a?(WordProblemNumber)
  end

  def word_problem_operator?(object)
    object.is_a?(WordProblemOperator)
  end

  def valid_number_and_operator_sequence?(sequence)
    number_count = 0
    operator_count = 0

    valid_sequence = sequence.each_with_index.all? do |object, index|
      if index.even?
        number_count += 1
        word_problem_number?(object)
      else
        operator_count += 1
        word_problem_operator?(object)
      end
    end

    valid_sequence && number_count > 0 && operator_count > 0
  end

  def valid_number_string?(number)
    number.to_i.to_s == number
  end

  def number_and_operator_sequence
    pattern_operators = OPERATORS.keys.join('|')
    pattern_numbers = "-?\\d+"
    pattern_combined = Regexp.new(pattern_operators + '|' + pattern_numbers)

    numbers_and_operators = word_problem_string.scan(pattern_combined)

    numbers_and_operators.map do |step|
      if valid_number_string?(step)
        WordProblemNumber.new(step.to_i)
      else
        WordProblemOperator.new(OPERATORS[step])
      end
    end
  end

  attr_accessor(:word_problem_string)
end
