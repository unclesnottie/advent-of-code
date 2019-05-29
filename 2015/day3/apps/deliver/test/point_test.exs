defmodule PointTest do
  use ExUnit.Case
  doctest Point

  describe "Point.move/2" do
    test "all positives" do
      assert pt(1, 2) == Point.move(pt(0, 0), pt(1, 2))
    end

    test "all negatives" do
      assert pt(-2, -1 ) == Point.move(pt(0,0), pt(-2, -1))
    end

    test "mix of everything" do
      assert pt(-2, 2) == Point.move(pt(-5, -1), pt(3, 3))
    end
  end

  describe "Point.from_char/1" do
    test "north" do
      assert pt(0, 1) == Point.from_char("^")
    end

    test "south" do
      assert pt(0, -1) == Point.from_char("v")
    end

    test "east" do
      assert pt(1, 0) == Point.from_char(">")
    end

    test "west" do
      assert pt(-1, 0) == Point.from_char("<")
    end

    test "start" do
      assert pt(0, 0) == Point.from_char("0")
    end
  end

  defp pt(x, y), do: %Point{x: x, y: y}
end
