defmodule NiceTest do
  use ExUnit.Case
  doctest Nice

  describe "Nice.is_nice2?/1" do
    test "example 1" do
      assert Nice.is_nice2?("qjhvhtzxzqqjkmpb")
    end

    test "example 2" do
      assert Nice.is_nice2?("xxyxx")
    end

    test "example 3" do
      refute Nice.is_nice2?("uurcxstgmygtbstg")
    end

    test "example 4" do
      refute Nice.is_nice2?("ieodomkazucvgmuy")
    end
  end

  describe "Nice.is_nice?/1" do
    test "example 1" do
      assert Nice.is_nice?("ugknbfddgicrmopn")
    end

    test "example 2" do
      assert Nice.is_nice?("aaa")
    end

    test "example 3" do
      refute Nice.is_nice?("jchzalrnumimnmhp")
    end

    test "example 4" do
      refute Nice.is_nice?("haegwjzuvuyypxyu")
    end

    test "example 5" do
      refute Nice.is_nice?("dvszwmarrgswjxmb")
    end

  end

end
