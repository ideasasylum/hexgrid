require 'test_helper'

describe Hex do
  def setup
    @grid = Grid.new
  end

  it "can be constructed with a Point" do
    hex = Hex.new(Point.new(1, 2, -3))
    hex.must_be_instance_of Hex
  end

  it "can be constructed with point coordinates" do
    hex = Hex.new(1, 2, -3)
    hex.must_be_instance_of Hex
    hex.point.must_equal Point.new(1,2,-3)
  end

  it "should remove itself from a grid" do
    hex = Hex.new(1, 2, -3)
    @grid << hex
    hex.remove
    hex.grid.must_be_nil
    @grid.hexs.must_be_empty
  end

  it "should fetch its neighbours from the grid" do
    hexs = [
      Hex.new(1, 2, -3),
      Hex.new(0, 3, -3),
      Hex.new(-1, 3, -2),
      Hex.new(-1, 2, -1),
      Hex.new(0, 1, -1),
      Hex.new(1, 1, -2)
    ]
    @grid << hexs

    hex = Hex.new(0, 2, -2)
    @grid << hex

    hex.neighbours.length.must_equal 6
    hex.neighbours.sort.must_equal hexs.sort
  end
end
