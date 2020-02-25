require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/Bear.rb')
require_relative('../models/River.rb')


class BearTest < MiniTest::Test

  def setup
    @bear1 = Bear.new("Paddington", "Spectacled Bear")

    @fish_river = River.new("Esk", ["Trout", "Salmon"])
    @no_fish_river = River.new("Puddle", [])
  end

# Getters tests
  def test_get_name()
    assert_equal("Paddington", @bear1.name)
  end

  def test_get_contents_of_stomach__empty()
    assert_equal([], @bear1.contents_of_stomach)
  end

  def test_get_contents_of_stomach__not_empty()
    @bear1.grab_a_fish(@fish_river)
    assert_equal(["Salmon"], @bear1.contents_of_stomach)
  end

  def test_get_contents_of_stomach__not_empty2()
    @bear1.grab_a_fish(@fish_river)
    @bear1.grab_a_fish(@fish_river)
    assert_equal(["Salmon", "Trout"], @bear1.contents_of_stomach)
  end

  def test_get_bear_type()
    assert_equal("Spectacled Bear", @bear1.type)
  end

# Methods tests

  def test_grab_a_fish__river_not_empty()
    @bear1.grab_a_fish(@fish_river)
    assert_equal(["Trout"], @fish_river.fish)
    assert_equal(["Salmon"], @bear1.contents_of_stomach)
    assert_equal(1, @fish_river.fish_count)
    assert_equal(1, @bear1.food_count)
  end

  def test_grab_a_fish__river_empty()
    assert_equal("There are no fish to catch.", @bear1.grab_a_fish(@no_fish_river))
    assert_equal(0, @no_fish_river.fish_count)
    assert_equal(0, @bear1.food_count)
  end

  def test_grab_a_fish__river_empty2()
    @bear1.grab_a_fish(@fish_river)
    @bear1.grab_a_fish(@fish_river)

    assert_equal("There are no fish to catch.", @bear1.grab_a_fish(@fish_river))
    assert_equal(0, @fish_river.fish_count)
    assert_equal(2, @bear1.food_count)
  end

  def test_food_count()
    @bear1.grab_a_fish(@fish_river)
    assert_equal(1, @bear1.contents_of_stomach.length)
  end

  def test_roar()
    assert_equal("Roar!", @bear1.roar)
  end

end
