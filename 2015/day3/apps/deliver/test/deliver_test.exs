defmodule DeliverTest do
  use ExUnit.Case
  doctest Deliver

  describe "Deliver.count_houses_robo/1" do
    test "example 1" do
      assert 3 == Deliver.count_houses_robo("^v")
    end
  end

  describe "Deliver.count_houses/1" do
    test "example 1" do
      assert 2 == Deliver.count_houses(">")
    end

    test "example 2" do
      assert 4 == Deliver.count_houses("^>v<")
    end

    test "example 3" do
      assert 2 == Deliver.count_houses("^v^v^v^v^v")
    end
  end

  describe "Deliver.build_moves/1" do
    test "example 1" do
      assert [pt(0, 0), pt(1, 0)] == Deliver.build_moves(">")
    end

    test "example 2" do
      assert [pt(0, 0), pt(0, 1), pt(1, 0), pt(0, -1), pt(-1, 0)] == Deliver.build_moves("^>v<")
    end
  end

  describe "Deliver.build_houses/1" do
    test "example 1" do
      assert [pt(0, 0), pt(1, 0)] == Deliver.build_houses([pt(0, 0), pt(1, 0)])
    end

    test "example 2" do
      expected = [pt(0, 0), pt(0, 1), pt(1, 1), pt(1, 0), pt(0, 0)]
      actual = Deliver.build_houses([pt(0, 0), pt(0, 1), pt(1, 0), pt(0, -1), pt(-1, 0)])
      assert expected == actual
    end
  end

  defp pt(x, y), do: %Point{x: x, y: y}
end
