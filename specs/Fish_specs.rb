require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../models/Fish.rb')

class FishTest < MiniTest::Test

  def setup
    @fish1 = Fish.new("Trout")
    @fish2 = Fish.new("Fossil Fish")
  end

  # Getters tests

    def test_get_name()
      assert_equal("Trout", @fish1.name)
    end

    def test_get_name2()
      assert_equal("Fossil Fish", @fish2.name)
    end
end
