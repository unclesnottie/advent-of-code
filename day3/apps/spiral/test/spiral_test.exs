defmodule SpiralTest do
  use ExUnit.Case
  doctest Spiral

  describe "Spiral.calc/1" do
    test "example 1" do
      assert Spiral.calc(1) == 0
    end

    test "example 2" do
      assert Spiral.calc(12) == 3
    end

    test "example 3" do
      assert Spiral.calc(23) == 2
    end

    test "example 4" do
      assert Spiral.calc(1024) == 31
    end
  end
end
