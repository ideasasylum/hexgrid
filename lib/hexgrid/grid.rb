class Grid
  include Enumerable

  def initialize
    @hexs = {}
  end

  def << hex
    if hex.respond_to? :each
      hex.each { |t| add_hex t }
    else
      add_hex hex
    end
  end

  def add_hex hex
    @hexs[hex.point] = hex
    hex.grid = self
  end

  def >> hex
    point = hex.point if hex.respond_to? :point
    point ||= hex
    removed_hex = @hexs.delete point
    removed_hex.grid = nil

    removed_hex
  end

  def [] point
    @hexs[point]
  end

  def each
    if block_given?
      @hexs.values.each { |hex| yield hex }
    end
  end

  def hexs
    @hexs.values
  end

  def length
    @hexs.size
  end
  alias :size :length
end
