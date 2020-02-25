class Bear

  attr_accessor :name, :contents_of_stomach, :type

  def initialize(name, type)
    @name = name
    @contents_of_stomach = []
    @type = type
  end

  def grab_a_fish(river)
    if !(river.fish.empty?)
      caught_fish = river.fish.pop()
      @contents_of_stomach.push(caught_fish)
    else
      return "There are no fish to catch."
    end
  end

  def food_count()
    return @contents_of_stomach.length()
  end

  def roar()
    return "Roar!"
  end

end
