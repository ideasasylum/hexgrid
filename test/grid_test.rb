require 'test_helper'

describe Grid do
  def setup
    @grid = Grid.new
    @point = Point.new 1, 2, -3
    @tile = Tile.new @point
  end

  it "should store and retrieve tiles" do
    @grid << @tile
    @grid[@point].must_equal @tile
  end

  it "should store and retrieve tiles" do
    tile2 = Tile.new(Point.new(1, 0, -1))
    tiles = [@tile, tile2]
    @grid << tiles
    @grid[@tile.point].must_equal @tile
    @grid[tile2.point].must_equal tile2
  end

  it "should iterate over tiles" do
    @grid << @tile
    @grid.each { |tile| tile.must_equal @tile }
  end

  it "should remove tiles using a point" do
    @grid << @tile
    (@grid >> @point).must_equal @tile
    @grid.length.must_equal 0
  end

  it "should remove tiles" do
    @grid << @tile
    (@grid >> @tile).must_equal @tile
    @grid.length.must_equal 0
  end

  it "should count tiles" do
    @grid.size.must_equal 0
    @grid << @tile
    @grid.length.must_equal 1
  end
end
