class Robot

  BASE_UID = 'AA000'
  @@next_id = BASE_UID

  attr_reader(:name)

  def initialize
    reset
  end

  def reset
    assign_new_and_increment_id
  end

  private

  def assign_new_and_increment_id
    self.name = @@next_id.dup
    @@next_id.next!
  end

  attr_writer(:name)

end