defmodule StufferTest do
  use ExUnit.Case
  doctest Stuffer

  describe "Stuffer.find_key/1" do
    test "example 1" do
      assert 609043 == Stuffer.find_key("abcdef")
    end

    test "example 2" do
      assert 1048970 == Stuffer.find_key("pqrstuv")
    end

    test "solution" do
      actual = Stuffer.find_key("iwrupvqb")
               |> IO.inspect(label: "key")
      assert 0 < actual
    end
  end

  describe "Stuffer.md5/1" do
    test "Elixir" do
      assert "A12EB062ECA9D1E6C69FCF8B603787C3" == Stuffer.md5("Elixir")
      assert "694F56F4B30E60837151723777795FC2" == Stuffer.md5("Elixir\n")
    end
  end

end
