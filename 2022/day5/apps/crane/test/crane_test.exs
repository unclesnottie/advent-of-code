defmodule CraneTest do
  use ExUnit.Case
  doctest Crane

  test "greets the world" do
    assert Crane.hello() == :world
  end
end
