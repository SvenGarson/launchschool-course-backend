class SumOfMultiples

	DEFAULT_MULTIPLES = [3, 5]

	def initialize(*multiples_list)
		self.multiples = multiples_list.empty? ? DEFAULT_MULTIPLES : multiples_list
	end

	def to(ceiling)
		self.class.sum_of_multiples(multiples, ceiling)
	end

	def self.to(ceiling)
		sum_of_multiples(DEFAULT_MULTIPLES, ceiling)
	end

	private

	def self.sum_of_multiples(multiples, ceiling)
		all_multiples = (1...ceiling).select do |potential|
			multiples.any? { |multiple| potential % multiple == 0 }
		end
		all_multiples.sum
	end

	attr_accessor :multiples

end