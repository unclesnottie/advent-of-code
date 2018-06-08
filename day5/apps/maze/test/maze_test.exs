defmodule MazeTest do
  use ExUnit.Case
  doctest Maze

  describe "Maze.get_steps/1" do
    test "example 1" do
      assert 5 == Maze.get_steps("0 3 0 1 -3")
    end

    test "ends with index < 0" do
      assert 4 == Maze.get_steps("0 3 0 1 -5")
    end
  end
end
