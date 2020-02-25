class River

  attr_accessor :name, :fish

  def initialize(name, fish)
    @name = name
    @fish = fish
  end

  def fish_count()
    return @fish.length
  end

end
