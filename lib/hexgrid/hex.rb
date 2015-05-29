class Hex
  include Comparable

  attr_accessor :point
  attr_accessor :grid

  def initialize *args
    if args.length == 1
      @point = args[0]
    elsif args.length > 1
      @point = Point.new *args
    end
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
