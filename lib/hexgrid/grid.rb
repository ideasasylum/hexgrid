class Grid
  include Enumerable

  def initialize
    @tiles = {}
  end

  def << tile
    if tile.respond_to? :each
      tile.each { |t| add_tile t }
    else
      add_tile tile
    end
  end

  def add_tile tile
    @tiles[tile.point] = tile
    tile.grid = self
  end

  def >> tile
    point = tile.point if tile.respond_to? :point
    point ||= tile
    removed_tile = @tiles.delete point
    removed_tile.grid = nil

    removed_tile
  end

  def [] point
    @tiles[point]
  end

  def each
    if block_given?
      @tiles.values.each { |tile| yield tile }
    end
  end

  def tiles
    @tiles.values
  end

  def length
    @tiles.size
  end
  alias :size :length
end
