class Point
  attr_reader :q, :r, :s
  include Comparable

  def initialize q, r, s = -q-r
    @q = q
    @r = r
    @s = s
    raise InvalidPointError unless valid?
  end

  def eql? other
    @q == other.q && @r == other.r && @s == other.s
  end

  def == other
    @q == other.q && @r == other.r && @s == other.s
  end

  def hash
    [@q, @r, @s].hash
  end

  # FIXME: Sorting by the hash seems pretty dumb. We only do it so we
  # can sort arrays of Points reliably for comparison
  def <=> other
    hash <=> other.hash
  end

  def + point
    Point.new(@q + point.q, @r + point.r, @s + point.s)
  end

  def - point
    Point.new(@q - point.q, @r - point.r, @s - point.s)
  end

  def * n
    Point.new(@q * n, @r * n, @s * n)
  end

  def valid?
    (@q + @r + @s) == 0
  end

  def to_s
    "[#{@q},#{@r},#{@s}]"
  end

  def length
    (@q.abs + @r.abs + @s.abs).to_f / 2.0
  end

  def distance point
    (self - point).length
  end

  EAST = Point.new(-1, 1, 0)
  WEST = Point.new(1, -1, 0)
  SOUTH_WEST = Point.new(0, -1, 1)
  SOUTH_EAST = Point.new(-1, 0, 1)
  NORTH_EAST = Point.new(0, 1, -1)
  NORTH_WEST = Point.new(1, 0, -1)

  VALID_DIRECTIONS = [
      Point::EAST,
      Point::SOUTH_EAST,
      Point::SOUTH_WEST,
      Point::WEST,
      Point::NORTH_WEST,
      Point::NORTH_EAST
  ]

  def neighbor direction
    raise InvalidDirectionError unless Point::VALID_DIRECTIONS.include? direction
    self + direction
  end
  alias :neighbour :neighbor

  def neighbors
    Point::VALID_DIRECTIONS.map { |direction| neighbor direction }
  end
  alias :neighbours :neighbors
end
