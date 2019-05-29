defmodule ParensTest do
  use ExUnit.Case
  doctest Parens

  describe "Parens.get_floor/1" do
    test "empty string" do
      assert 0 == Parens.get_floor("")
    end

    test "single (" do
      assert 1 == Parens.get_floor("(")
    end

    test "single )" do
      assert -1 == Parens.get_floor(")")
    end

    test "example 1" do
      assert 0 == Parens.get_floor("(())")
      assert 0 == Parens.get_floor("()()")
    end

    test "example 2" do
      assert 3 == Parens.get_floor("(((")
      assert 3 == Parens.get_floor("(()(()(")
    end

    test "example 3" do
      assert 3 == Parens.get_floor("))(((((")
    end

    test "example 4" do
      assert -1 == Parens.get_floor("())")
      assert -1 == Parens.get_floor("))(")
    end

    test "example 5" do
      assert -3 == Parens.get_floor(")))")
      assert -3 == Parens.get_floor(")())())")
    end
  end

  describe "Parens.get_basement/1" do
    test "answer is nil" do
      assert nil == Parens.get_basement("(((")
      assert nil == Parens.get_basement("()(()((")
    end

    test "example 1" do
      assert 1 == Parens.get_basement(")")
    end

    test "example 2" do
      assert 5 == Parens.get_basement("()())")
    end
  end
end
