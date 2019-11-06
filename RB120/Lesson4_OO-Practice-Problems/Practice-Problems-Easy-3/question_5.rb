class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new # this is fine
tv.manufacturer     # no instance method with that name
tv.model            # this s fine

Television.manufacturer # this is fine
Television.model        # no class method with that name