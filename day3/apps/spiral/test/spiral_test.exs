defmodule SpiralTest do
  use ExUnit.Case
  doctest Spiral

  describe "Spiral.calc/1" do
    test "example 1" do
      assert 0 == Spiral.calc(1)
    end

    test "example 2" do
      assert 3 == Spiral.calc(12)
    end

    test "example 3" do
      assert 2 == Spiral.calc(23)
    end

    test "example 4" do
      assert 31 == Spiral.calc(1024)
    end
  end
end
