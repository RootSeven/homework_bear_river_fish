require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/River.rb')

class RiverTest < MiniTest::Test

  def setup
    @river1 = River.new("Esk", ["Trout", "Salmon"])
    @river2 = River.new("Danube", ["Sunfish", "Moonfish", "Starfish"])
  end

# Getters tests

  def test_get_name()
    assert_equal("Esk", @river1.name)
  end

  def test_get_name2()
    assert_equal("Danube", @river2.name)
  end

  def test_get_fish()
    assert_equal(["Trout", "Salmon"], @river1.fish)
  end

  def test_get_fish2()
    assert_equal(["Sunfish", "Moonfish", "Starfish"], @river2.fish)
  end

# Method tests

  def test_fish_count()
    assert_equal(2, @river1.fish_count)
  end

  def test_fish_count2()
    assert_equal(3, @river2.fish_count)
  end

end
