defmodule ChecksumTest do
  use ExUnit.Case
  doctest Checksum

  describe "Checksum.calc/1" do
    test "example 1" do
      spreadsheet = [[5, 1, 9, 5], [7, 5, 3], [2, 4, 6, 8]]
      assert 18 == Checksum.calc(spreadsheet)
    end

    test "example 2" do
      spreadsheet = [[1, 1], [2, 2], [3, 3], [4, 4]]
      assert 0 == Checksum.calc(spreadsheet)
    end
  end

  describe "Checksum.row_score/1" do
    test "example 1" do
      r = [5, 9, 2, 8]
      assert 4 == Checksum.row_score(r)
    end

    test "example 2" do
      r = [9, 4, 7, 3]
      assert 3 == Checksum.row_score(r)
    end
  end

  describe "Checksum.calc2/1" do
    test "example 1" do
      spreadsheet = [[5, 9, 2, 8], [9, 4, 7, 3], [3, 8, 6, 5]]
      assert 9 == Checksum.calc2(spreadsheet)
    end
  end
end
