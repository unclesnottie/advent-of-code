defmodule WrapTest do
  use ExUnit.Case
  doctest Wrap

  describe "Wrap.calc_total_ribbon/1" do
    test "examples" do
      assert 34 + 14 == Wrap.calc_total_ribbon("""
      2x3x4
      1x1x10
      """)
    end
  end

  describe "Wrap.calc_single_ribbon/1" do
    test "example 1" do
      assert 34 == Wrap.calc_single_ribbon([2, 3, 4])
    end

    test "example 2" do
      assert 14 == Wrap.calc_single_ribbon([1, 1, 10])
    end
  end

  describe "Wrap.calc_total_sqft/1" do
    test "examples" do
      assert 58 +43 == Wrap.calc_total_sqft("""
      2x3x4
      1x1x10
      """)
    end
  end

  describe "Wrap.split_string/1" do
    test "single line" do
      assert [[1, 2, 3]] == Wrap.split_string("1x2x3")
    end

    test "multiple line no trailing newline" do
      assert [[1, 2, 3], [4, 3, 2]] == Wrap.split_string("""
      1x2x3
      4x3x2
      """)
    end

    test "multiple line with trailing newline" do
      assert [[6, 4, 5], [8, 3, 2]] == Wrap.split_string("""
      6x4x5
      8x3x2
      """)
    end
  end

  describe "Wrap.calc_single_sqft/1" do
    test "example 1" do
      assert 58 == Wrap.calc_single_sqft([2, 3, 4])
    end

    test "example 2" do
      assert 43 == Wrap.calc_single_sqft([1, 1, 10])
    end
  end
end
