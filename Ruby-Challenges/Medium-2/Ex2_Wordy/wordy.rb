=begin

  'What is 5 plus 13?'
  'What is 7 + -2?'

  - replace operator string with +-/*
  - remove everything but numbers and operators with: /[a-z\s]/
  - extract groups where first is not lead by any operator
    using the regex: /[-|\+|\*|\/]?\d+/
  - make list of groups where each object [nil or operator symbol, value]
  - accum that stuff
  
  

=end

class WordProblem

  def initialize(problem_string)
    
  end

end