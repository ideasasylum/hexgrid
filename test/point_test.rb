require 'test_helper'

describe Point do
  it "should have equality" do
    Point.new(1, 2, -3).must_equal Point.new(1, 2, -3)
    Point.new(1, 2, -3).wont_equal Point.new(2, -3, 1)
  end

  it "should have hash" do
    Point.new(1, 2, -3).hash.must_equal Point.new(1, 2, -3).hash
  end

  it "should perform addition" do
    a = Point.new 1, 2, -3
    b = Point.new 0, -1, 1

    (a+b).must_equal Point.new(1, 1, -2)
  end

  it "should perform subtraction" do
    a = Point.new 1, 2, -3
    b = Point.new -1, 0, 1

    (a-b).must_equal Point.new(2, 2, -4)
  end

  it "should perform multiplication" do
    a = Point.new 1, 2, -3

    (a*2).must_equal Point.new(2, 4, -6)
  end

  it "can convert to a string" do
    Point.new(1,2,-3).to_s.must_equal "[1,2,-3]"
  end

  it "check validity" do
    Point.new(1,2,-3).must_be :valid?
  end

  it "can't create invalid points" do
    ->{ Point.new(1,2,3) }.must_raise InvalidPointError
  end

  it "should have a length" do
    Point.new(1,2,-3).length.must_equal 3.0
  end

  it "should compare distances" do
    a = Point.new(1, 2, -3)
    b = Point.new(0, 3, -3)
    c = Point.new(1, 0, -1)
    d = Point.new(1, -3, 2)
    a.distance(b).must_equal 1
    a.distance(c).must_equal 2
    a.distance(d).must_equal 5
  end

  it "should find the neighbour" do
    a = Point.new(1, 2, -3)
    b = Point.new(0, 3, -3)
    c = Point.new(1, 1, -2)

    a.neighbour(Point::EAST).must_equal b
    a.neighbor(Point::SOUTH_WEST).must_equal c
  end

  it "should find all the neighbours" do
    a = Point.new(0, 2, -2)
    a.neighbours.length.must_equal 6
    expected = [
      Point.new(1, 2, -3),
      Point.new(0, 3, -3),
      Point.new(-1, 3, -2),
      Point.new(-1, 2, -1),
      Point.new(0, 1, -1),
      Point.new(1, 1, -2)
    ].sort
    a.neighbours.sort.must_equal expected
  end


end
