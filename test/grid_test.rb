require 'test_helper'

describe Grid do
  def setup
    @grid = Grid.new
    @point = Point.new 1, 2, -3
    @hex = Hex.new @point
  end

  it "should store and retrieve tiles" do
    @grid << @hex
    @grid[@point].must_equal @hex
  end

  it "should store and retrieve tiles" do
    tile2 = Hex.new(1, 0, -1)
    tiles = [@hex, tile2]
    @grid << tiles
    @grid[@hex.point].must_equal @hex
    @grid[tile2.point].must_equal tile2
  end

  it "should iterate over tiles" do
    @grid << @hex
    @grid.each { |tile| tile.must_equal @hex }
  end

  it "should remove tiles using a point" do
    @grid << @hex
    (@grid >> @point).must_equal @hex
    @grid.length.must_equal 0
  end

  it "should remove tiles" do
    @grid << @hex
    (@grid >> @hex).must_equal @hex
    @grid.length.must_equal 0
  end

  it "should count tiles" do
    @grid.size.must_equal 0
    @grid << @hex
    @grid.length.must_equal 1
  end
end
