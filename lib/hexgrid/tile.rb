class Tile
  include Comparable

  attr_accessor :point
  attr_accessor :grid

  def initialize point=nil
    @point = point
  end

  def neighbours
    @point.neighbours.map { |point| @grid[point] }.compact
  end

  def remove
    @grid >> self
  end

  # FIXME: Sorting by the hash seems pretty dumb. We only do it so we
  # can sort arrays of Points reliably for comparison
  def <=> other
    point <=> other.point
  end

  def to_s
    @point.to_s
  end
end
