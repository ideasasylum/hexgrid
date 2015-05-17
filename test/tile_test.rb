require 'test_helper'

describe Tile do
  def setup
    @grid = Grid.new
  end

  it "can be constructed with a Point" do
    tile = Tile.new(Point.new(1, 2, -3))
    tile.must_be_instance_of Tile
  end

  it "can be constructed with point coordinates" do
    tile = Tile.new(1, 2, -3)
    tile.must_be_instance_of Tile
    tile.point.must_equal Point.new(1,2,-3)
  end

  it "should remove itself from a grid" do
    tile = Tile.new(1, 2, -3)
    @grid << tile
    tile.remove
    tile.grid.must_be_nil
    @grid.tiles.must_be_empty
  end

  it "should fetch its neighbours from the grid" do
    tiles = [
      Tile.new(1, 2, -3),
      Tile.new(0, 3, -3),
      Tile.new(-1, 3, -2),
      Tile.new(-1, 2, -1),
      Tile.new(0, 1, -1),
      Tile.new(1, 1, -2)
    ]
    @grid << tiles

    tile = Tile.new(0, 2, -2)
    @grid << tile

    tile.neighbours.length.must_equal 6
    tile.neighbours.sort.must_equal tiles.sort
  end
end
