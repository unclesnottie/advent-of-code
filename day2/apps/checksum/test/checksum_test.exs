defmodule ChecksumTest do
  use ExUnit.Case
  doctest Checksum

  describe "Checksum.calc/1" do
    test "example 1" do
      spreadsheet = [[5, 1, 9, 5], [7, 5, 3], [2, 4, 6, 8]]
      assert Checksum.calc(spreadsheet) == 18
    end

    test "example 2" do
      spreadsheet = [[1, 1], [2, 2], [3, 3], [4, 4]]
      assert Checksum.calc(spreadsheet) == 0
    end
  end
end
