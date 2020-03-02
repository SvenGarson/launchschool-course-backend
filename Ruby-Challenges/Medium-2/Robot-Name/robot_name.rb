class Robot
  @@existing_names = Array.new

  ALPHA_CHARACTERS = ('A'..'Z').to_a.freeze
  RESEED_RANGE = (9..999).freeze

  attr_reader(:name)

  def initialize
    reset
  end

  def reset
    old_name = name
    self.name = random_unique_name
    remove_name_from_list(old_name)
    add_name_to_list(name)
  end

  private

  def remove_name_from_list(name)
    @@existing_names.delete(name)
  end

  def add_name_to_list(name)
    @@existing_names << name
  end

  def name_exists_already?(name)
    @@existing_names.include?(name)
  end

  def reseed
    srand(rand(RESEED_RANGE))
  end

  def random_untested_name
    reseed

    name = ''

    2.times { |_| name << ALPHA_CHARACTERS.sample }
    3.times { |_| name << rand(0..9).to_s }

    name
  end

  def random_unique_name
    unique_name = random_untested_name

    while name_exists_already?(unique_name)
      unique_name = random_untested_name
    end

    unique_name
  end

  attr_writer(:name)
end
